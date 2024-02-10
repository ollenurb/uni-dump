FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y curl unzip default-jre \
    && curl "https://download.ontotext.com/owlim/13956f1e-3766-11ee-910e-42843b1b6b38/graphdb-10.3.1-dist.zip?utm_campaign=%5BProduct%5D%20GraphDB&utm_medium=email&_hsmi=221550809&_hsenc=p2ANqtz-_IHSaLRSLCPJ-iDgzcDPSuvkMdbSe_OCblXf6B1pbZi-Rw-lcWs36xAiQI5fX3H3UK-aVmYSyX8CAl0G5Z9Jtt6Qf2OA&utm_content=221550809&utm_source=hs_automation" -o /home/graphdb.zip\
    && unzip /home/graphdb.zip -d /home/

ENTRYPOINT ["/home/graphdb-10.3.1/bin/graphdb"]
