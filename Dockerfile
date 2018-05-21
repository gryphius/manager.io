FROM ubuntu
RUN apt-get -y update && apt-get -y install curl && version=$(curl http://www.manager.io/version.txt) ; curl --output Manager.deb https://d2ap5zrlkavzl7.cloudfront.net/$version/Manager.deb && DEBIAN_FRONTEND=noninteractive apt install -y ./Manager.deb
RUN mkdir -p /managerdata
CMD [ "/usr/bin/mono", "/opt/manager-accounting/ManagerServer.exe", "-port 8080" "-path /managerdata" ]
VOLUME /managerdata
EXPOSE 8080
