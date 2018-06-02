# the latest version can be found at curl http://www.manager.io/version.txt
ARG VER=18.5.39
FROM ubuntu:18.04
RUN apt-get -y update && apt-get -y install curl && version=$VER ; curl --output Manager.deb https://d2ap5zrlkavzl7.cloudfront.net/$version/Manager.deb && DEBIAN_FRONTEND=noninteractive apt install -y ./Manager.deb
RUN mkdir -p /var/lib/manager
VOLUME /var/lib/manager
EXPOSE 8080
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/usr/bin/mono /opt/manager-accounting/ManagerServer.exe -port 8080 -path /var/lib/manager"]
