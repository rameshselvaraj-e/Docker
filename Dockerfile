docker pull centos:centos7.9.2009

Syntax and explanation:
FROM -> To pull the base image from Docker hub
RUN -> To execute Commands
CMD -> TO provide defaults for an executing container
ENTRYPOINT -> To configure a container that will run as an executable
WORKDIR -> To sets the working directory
COPY -> To copy a file / directory from local host to docker container
ADD -> To copy files & Folders from local hosts to doceker containers. help us dowloand the packages from git/website url's
EXPOSE -> Docker container listen on the specific port at runtime
ENV -> To set Environment Variables


Test Case 1:
FROM centos:centos7.9.2009
RUN yum install telnet -y && yum install iputils -y
RUN mkdir -p /app
COPY index.html /app
ENTRYPOINT ["ping"]
CMD ["c", "3", "192.168.10.1"]

  docker build -t ramesh .
  docker images
  docekr run -it ramesh
  docker run -it ramesh -c 5 192.168.10.1
  docker run -dit ramesh
  docekr exec -it <container id>  -> Error responss from daemon, because container is not running.
  
  docekr ps -a -> check the container status (EXITED state)
  
  Entry point change the /bin/sh instead of ping command:
  docker run -it --entrypoint /bin/sh ramesh
  ls -ld /app
  ls -l index.html


Test Case 2:
FROM centos:centos7.9.2009
RUN yum install vim -y && yum install httpd -y
RUN mkdir -p /app/var/wwww
COPY index.html /app/var/www

Test Case 3: 
Install tomcat on centos
a) Pill Centos from docker hub                    FROM
b) install java                                   RUN
c) Create directory /app/tomcat                   RUN
d) change working directory /app/tomcat           WORKDIR
e) Download tomcat packages                       ADD / RUN
f) Extract tar.gz file                            RUN
g) Rename to tomcat directory                     RUN
h) Docker to runs on port 8080 for tomcat services EXPOSE
i) Start tomcat service                           CMD

docker images
docekr ps -a
vi Dockerfile
FROM centos:centos7.9.2009
RUN yum install java -y
RUN mkdir -p /app/tomcat
WORKDIR /app/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.54.tar.g
RUN mv apache-tomcat /app/tomcat
EXPOSE 8080
CMD ["/app/tomcat/bin/catalina.sh", "run"]

docker build -t rameshtamcat .  
docker duild -t rameshtamcat -f /app/Dockerfile  -> if it is different location

docekr images
docekr run -d --name rameshweb -p 8081:8080 rameshtamcat
docekr ps -a

http:192.168.10.10:8081

adding war file:
vi Dockerfile
FROM centos:centos7.9.2009
RUN yum install java -y
RUN mkdir -p /app/tomcat
WORKDIR /app/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.54.tar.g
RUN mv apache-tomcat /app/tomcat
EXPOSE 8080
COPY ./webapp.war /app/tomcat/webapps
CMD ["/app/tomcat/bin/catalina.sh", "run"]

docker build -t rameshtamcat . 
docekr images
docekr run -d --name ramesh_webdemo -p 8082:8080 rameshtamcat
docekr ps -a

http:192.168.10.10:8081/webapps

docker stop <container id>
docker start <container id>
docker rm <container id>



