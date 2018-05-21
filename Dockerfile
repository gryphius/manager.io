FROM ubuntu:17.10
RUN apt-get -y update && apt-get -y install curl && version=17.10.44 ; curl --output Manager.deb https://d2ap5zrlkavzl7.cloudfront.net/$version/Manager.deb && DEBIAN_FRONTEND=noninteractive apt install -y ./Manager.deb
RUN mkdir -p /managerdata
CMD ["/usr/bin/mono","/opt/manager-accounting/ManagerServer.exe","-port 8080","-path /managerdata"]
VOLUME /managerdata
EXPOSE 8080
