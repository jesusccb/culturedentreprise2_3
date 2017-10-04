#FROM glassfish:latest
#FROM oracle/glassfish
FROM oracle/glassfish:nightly

#creator
MAINTAINER Silvestre Jesus Ccorahua Balboa <jesusccb@gmail.com>

#environment variables
ENV DATABASE_HOST db
ENV DATABASE_PORT 3306
ENV DATABASE_NAME my_database
ENV DATABASE_USER root
ENV DATABASE_PASSWORD password
ENV GLASSFISH_HTTP_THREADPOOL_MAX_SIZE 500

# Internal environment variables
ENV GLASSFISH_ADMIN_USER admin
ENV GLASSFISH_DOMAIN domain1
ENV MYSQL_JAVA_CONNECTOR_VERSION 5.1.34
ENV MYSQL_JAVA_CONNECTOR_NAME mysql-connector-java-${MYSQL_JAVA_CONNECTOR_VERSION}
ENV MYSQL_JAVA_CONNECTOR_LIB_PATH /tmp/${MYSQL_JAVA_CONNECTOR_NAME}/${MYSQL_JAVA_CONNECTOR_NAME}.jar

#RUN curl http://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.34/mysql-connector-java-5.1.34.jar -o /glassfish5/glassfish/domains/domain1/lib/mysql-connector-java-5.1.34.jar

#COPY the files en images
COPY ./mysql-connector-java-5.1.34.jar /glassfish5/glassfish/domains/domain1/lib/
COPY ./code/WebApplication1.war /glassfish5/glassfish/domains/domain1/autodeploy/
COPY ./start-server.sh /
COPY ./glassfish_admin_password.txt /tmp/

#initialize the server: start server , connection pool with the db
RUN ["bash" ,"+x",  "/start-server.sh"]









#CMD chmod +x /start-server.sh
#CMD bash /start-server.sh
#CMD ["/glassfish5/bin/asadmin", "start-domain", "-v"]
#WORKDIR /
#RUN chmod +x create-connection-with-db.sh
#CMD ["create-connection-with-db.sh"]
#CMD chmod 777 /create-connection-with-db.sh

#$ docker build -f Dockerfile .
#$ docker run --name my-container-glassfish --link my-container-mysql:mysl -e ADMIN_PASSWORD=password -p 14848:4848 -p 18080:8080 -d b3f723fdffa8

