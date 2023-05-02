docker pull centos:centos7.9.2009


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

