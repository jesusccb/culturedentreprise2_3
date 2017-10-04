#mysql -u root -e "CREATEDATABASE mydbcreatedfromscript"
#mysql --user="root" --password="password" --execute="CREATE DATABASE IF NOT EXISTS jesus-db;";
#mysql -u root -ppassword mydbcreatedfromscript< /NYCP_database.Derby.sql
mysql -u root -ppassword < /docker-entrypoint-initdb.d/NYCP_database.Derby.sql

