#FROM mysql
FROM mysql/mysql-server

MAINTAINER SilvestreJesus Ccorahu Balboa 

# Copy the database initialization part 2 
COPY ./db-init-2.sh /docker-entrypoint-initdb.d

#create tables and add rows
COPY ./NYCP_database.Derby.sql /docker-entrypoint-initdb.d








#Run mysql script
#RUN chmod 777 /docker-entrypoint-initdb.d/db-init-2.sh && /docker-entrypoint-initdb.d/db-init-2.sh 

#COPY ./bootstrap.sh /
#RUN chmod u+x /bootstrap.sh/

# Execute the bootstrap file
#ENTRYPOINT ["/docker-entrypoint-initdb.d/db-init.sh"]

#CMD chmod 777 /docker-entrypoint-initdb.d/db-init-2.sh && /docker-entrypoint-initdb.d/db-init-2.sh 

#$ docker build -f Dockerfile .
#$ docker run -it --name my-container-mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -d 48dcb0c3f09e /bin/bash
