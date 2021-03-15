FROM ubuntu:latest

LABEL "com.github.actions.name"="SonarQube project data importer"
LABEL "com.github.actions.description"="Import report data from Sonarqube and use it in Github"

RUN apt-get update && apk-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]