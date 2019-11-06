FROM debian:9

RUN apt-get update -yqq && \
  apt install mysql-server -yqq
  
RUN mkdir -p /data
  
RUN /etc/init.d/mysql stop
COPY conf/my.cnf /etc/mysql/my.cnf
RUN cp -R -p /var/lib/mysql/* /data
  
#RUN /etc/init.d/mysql start
  
VOLUME /data

EXPOSE 3306/tcp
