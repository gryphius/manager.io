# the latest version can be found at curl http://www.manager.io/version.txt
FROM ubuntu:18.04
ENV VER=18.12.25
RUN apt-get -y update && \
  apt-get -y install curl && \
  curl --output Manager.deb https://d2ap5zrlkavzl7.cloudfront.net/$VER/Manager.deb && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y ./Manager.deb
RUN mkdir -p /var/lib/manager
VOLUME /var/lib/manager
EXPOSE 8080
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/usr/bin/mono /opt/manager-accounting/ManagerServer.exe -port 8080 -path /var/lib/manager"]
