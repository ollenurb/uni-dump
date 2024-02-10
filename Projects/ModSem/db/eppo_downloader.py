import requests
import json
import psycopg2
import time

class Host:
    eppo_code = ""
    name = ""
    alternative_names = ""
    phylum_eppo_code = ""
    pyhylum_name = ""
    family_eppo_code = ""
    family_name = ""

class HostName:
    name = ""
    lang = ""

hosts_per_pathogen_limit = 10

api_url = "https://data.eppo.int/api/rest/1.0/taxon/"
token = "0a4a26d058f2ec90cee1271998af3885"

# Retrieve pathogens from DB
conn = psycopg2.connect("dbname=plant_pathology user=postgres")
cur = conn.cursor()
cur.execute("SELECT eppo_code FROM pathogens;")
pathogens_response = cur.fetchall()
conn.close()

fetched_hosts = {}

# Fetch hosts for each pathogen from EPPO
print("Retrieving data from EPPO...")
print("  Fetching pathogens' hosts...")
for row in pathogens_response:
    pathogen = row[0]
    response = requests.get(api_url + pathogen + "/hosts?authtoken=" + token).json()

    pathogen_hosts = []

    hosts = response['Host'] if 'Host' in response else []
    major_hosts = response['Major host'] if 'Major host' in response else []
    experimental_hosts = response['Experimental'] if 'Experimental' in response else []

    for major_host in major_hosts:
        pathogen_hosts.append((major_host['eppocode'], major_host['full_name'], 'm'))
    for host in hosts:
        pathogen_hosts.append((host['eppocode'], host['full_name'], 'h'))
    for experimental_host in experimental_hosts:
        pathogen_hosts.append((experimental_host['eppocode'], experimental_host['full_name'], 'e'))

    # Limit number of hosts to avoid inpractical dataset
    fetched_hosts[pathogen] = pathogen_hosts[:hosts_per_pathogen_limit] if hosts_per_pathogen_limit else pathogen_hosts

# Filter hosts in order to insert them (uniquely) in the DB
filtered_hosts = []
for hosts in fetched_hosts.values():
     for host in hosts:
         filtered_hosts.append((host[0], host[1]))
filtered_hosts = list(set(filtered_hosts)) # From list to set to list to make it subscriptable

# Fetch plant phylum and family in order to store them
print("  Fetching hosts' names and taxonomic attributes...")
finalized_hosts  = []

for filtered_host in filtered_hosts:
    host = Host()
    host_names = []
    host.eppo_code, host.name = filtered_host

    # Fetch host's phylum and family from EPPO global DB
    response = requests.get(api_url + host.eppo_code + "/taxonomy?authtoken=" + token).json()

    for taxonomy_class in response:
        if taxonomy_class['level'] == 2: # phylum (based on taxonomy level)
            host.phylum_eppo_code = taxonomy_class['eppocode']
            host.phylum_name = taxonomy_class['prefname']
        elif taxonomy_class['prefname'].endswith('aceae'): # family (based on suffix)
            host.family_eppo_code = taxonomy_class['eppocode']
            host.family_name = taxonomy_class['prefname']

    # Fetch host's names from EPPO global DB
    response = requests.get(api_url + host.eppo_code + "/names?authtoken=" + token).json()

    for name in response:
        if name['isolang'] == "it" or name['isolang'] == "en": # Store english or italian names
            host_name = HostName()
            host_name.name = name['fullname'][0:1].upper() + name['fullname'][1:].replace("'", "''")
            host_name.lang = name['isolang']
            host_names.append(host_name)
    host.alternative_names = host_names

    finalized_hosts.append(host)

print("Data retrieval from EPPO completed.")

# Write host plants to a SQL file
print("Writing host plants to SQL file...")
f = open("hosts.sql", "w")
f.write("\c plant_pathology;\n")
f.write("TRUNCATE TABLE plants, pathogens_hosts, plants_names;\n\n")

f.write(f"-- Plants found to be host to stored pathogens\n")
f.write("INSERT INTO plants(eppo_code, name, phylum_eppo_code, phylum_name, family_eppo_code, family_name) VALUES")
for host in finalized_hosts[:-1]:
    f.write(f"\n    ('{host.eppo_code}', '{host.name}', '{host.phylum_eppo_code}', '{host.phylum_name}', '{host.family_eppo_code}', '{host.family_name}'),")
f.write(f"\n    ('{finalized_hosts[-1].eppo_code}', '{finalized_hosts[-1].name}', '{finalized_hosts[-1].phylum_eppo_code}', '{finalized_hosts[-1].phylum_name}', '{finalized_hosts[-1].family_eppo_code}', '{finalized_hosts[-1].family_name}');")
print("Writing host plants to SQL file completed.")

print("Writing hosts plants' name to SQL file...")
for host in finalized_hosts:
    if host.alternative_names: # Some hosts lack alt names in the EPPO DB
        f.write(f"\n\n-- Names for host {host.name}\n")
        f.write("INSERT INTO plants_names(plant, name, language) VALUES")
        for host_name in host.alternative_names[:-1]:
            f.write(f"\n    ('{host.eppo_code}', '{host_name.name}', '{host_name.lang}'),")
        f.write(f"\n    ('{host.eppo_code}', '{host.alternative_names[-1].name}', '{host.alternative_names[-1].lang}');")
print("Writing host plants' name to SQL file completed.")

# Write pathogen-plant relations to a SQL file
print("Writing pathogen-plan relations to SQL file...")
for pathogen, hosts in fetched_hosts.items():
    if hosts: # Some pathogens lack hosts in the EPPO DB
        f.write(f"\n\n-- Hosts for {pathogen} pathogen\n")
        f.write("INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES")
        for host in hosts[:-1]:
            f.write(f"\n    ('{pathogen}', '{host[0]}', '{host[2]}'),")
        f.write(f"\n    ('{pathogen}', '{hosts[-1][0]}', '{hosts[-1][2]}');")
f.close()
print("Writing pathogen-plan relations to SQL file completed.")
