#!/usr/bin/env python3
from concurrent.futures import ThreadPoolExecutor, wait
from os import cpu_count, getcwd
from subprocess import  Popen, DEVNULL, PIPE


# --------------------
# CONSTANTS
MAVEN = {
    "CMD": ["./mvnw", "clean", "package", "-Dmaven.test.skip"],
    "PROJECTS": [
        ("eureka",   8761, False),
        ("gateway",  8080, False),
        ("auth",     8081, False),
        ("users",    8082, True ),
        ("groups",   8083, True ),
        ("meetings", 8084, True )
    ] # (service_name, service_port, needs_db)
}


DOCKER = {
    "CMD": ["docker", "build", ".", "-f", "-"],
    "TEMPLATES": {
        "MAIN": """
            FROM openjdk:18-alpine
            COPY target/{service}-0.0.1.jar /app.jar
            EXPOSE {port:d}
            RUN adduser -D web && \\
                chown web /app.jar && \\
                chmod +x /app.jar
        """,
        "WITHOUT_DB": """
            USER web
            ENTRYPOINT ["java", "-jar", "/app.jar"]
        """,
        "WITH_DB": """
            RUN echo -e "https://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \\
                apk update && \\
                apk add --no-cache postgresql14
            USER postgres
            RUN mkdir /var/lib/postgresql/data && \\
                chmod 0700 /var/lib/postgresql/data && \\
                initdb -D /var/lib/postgresql/data && \\
                sed -r "s/unix_socket_directories\s*=\s*'.*?'/unix_socket_directories='\/tmp'/g" -i /var/lib/postgresql/data/postgresql.conf
            USER root
            RUN echo -e "su postgres -c 'pg_ctl start -D /var/lib/postgresql/data'\\nsu web -c 'java -jar /app.jar'" > /docker-entrypoint.sh && \\
                chmod +x /docker-entrypoint.sh
            ENTRYPOINT "/docker-entrypoint.sh"
        """
    }
}


# --------------------
# FUNCTIONS
def build_microservice(service):
    service_cwd = "{}/{}".format(getcwd(), service)
    with Popen(MAVEN["CMD"], stdout=DEVNULL, stderr=DEVNULL, cwd=service_cwd, shell=False) as process:
        print(f" ---->> Building '{service}' microservice jar...")
        if process.wait() == 0:
            print(f" ---->> Microservice jar '{service}' OK!")
            return True
        else:
            print(f" ---->> Microservice jar '{service}' FAILED!")
            return False


def build_dockerimage(service, port, db):
    service_cwd = "{}/{}".format(getcwd(), service)
    input_string = (DOCKER["TEMPLATES"]["MAIN"]).format(service = service, port = port)
    input_string += DOCKER["TEMPLATES"]["WITH_DB"] if db is True else DOCKER["TEMPLATES"]["WITHOUT_DB"]
    with Popen([*(DOCKER["CMD"]), "-t", f"brc/{service}:latest"], stdin=PIPE, stdout=DEVNULL, stderr=DEVNULL, cwd=service_cwd, shell=False) as process:
        print(f" ---->> Building '{service}' docker image...")
        process.communicate(str.encode(input_string))
        if process.wait() == 0:
            print(f" ---->> Docker image '{service}' OK!")
            return True
        else:
            print(f" ---->> Docker image '{service}' FAILED!")
            return False


def task(service, port, db):
    build_microservice(service) and \
        build_dockerimage(service, port, db)


def main():
    max_workers = min(cpu_count(), len(MAVEN["PROJECTS"]))
    with ThreadPoolExecutor(max_workers) as executor:
        futures = { executor.submit(task, s, p, d): (s, p, d) for (s, p, d) in MAVEN["PROJECTS"] }
        wait(futures)


# --------------------
# MAIN
if __name__ == '__main__':
    main()
