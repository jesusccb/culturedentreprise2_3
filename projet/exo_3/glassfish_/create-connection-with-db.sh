# Cerberus Glassfish configuration

# Fail on any error
#set -e

# Use asadmin with credentials
ASADMIN="asadmin --user ${GLASSFISH_ADMIN_USER} --passwordfile /tmp/glassfish_admin_password.txt"




# Setup Glassfish to the Cerberus needs
function setup() {
    echo "* creation connection pool..."

    # Copy the MySQL Java connector to Glassfish global libraries folder
    #cp ${MYSQL_JAVA_CONNECTOR_LIB_PATH} ${GLASSFISH_HOME}/glassfish/lib

    # Set the admin password
    local ASADMIN_DEFAULT=asadmin
    local ASADMIN_PATH =/glassfish5/bin/asadmin
    ${ASADMIN} start-domain ${GLASSFISH_DOMAIN}
    ${ASADMIN_PATH} --user ${GLASSFISH_ADMIN_USER} --passwordfile /tmp/glassfish_admin_set_password.txt change-admin-password --domain_name ${GLASSFISH_DOMAIN}

    # Configure Glassfish to the Cerberus needs
    ${ASADMIN} restart-domain ${GLASSFISH_DOMAIN}
    ${ASADMIN} enable-secure-admin
   # ${ASADMIN_PATH} create-jvm-options --target server "-Dorg.cerberus.environment=prd"
    ${ASADMIN} create-jdbc-connection-pool --datasourceclassname com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource --restype javax.sql.ConnectionPoolDataSource --steadypoolsize 2 --property user=${DATABASE_USER}:password=${DATABASE_PASSWORD}:ServerName=${DATABASE_HOST}:DatabaseName=${DATABASE_NAME}:portNumber=${DATABASE_PORT} connection_pool_db
    ${ASADMIN} create-jdbc-resource --connectionpoolid connection_pool_db jdbc/mydb_prd
    ${ASADMIN} create-auth-realm  --target server --classname com.sun.enterprise.security.auth.realm.jdbc.JDBCRealm --property jaas-context=jdbcRealm:datasource-jndi=jdbc/mydb_prd:user-table=user:user-name-column=Login:password-column=Password:group-table=usergroup:group-name-column=GroupName:digest-algorithm=SHA-1 securityGlassDB
    ${ASADMIN} set server-config.security-service.default-realm=securityGlassDB
    ${ASADMIN} set server.thread-pools.thread-pool.http-thread-pool.max-thread-pool-size=${GLASSFISH_HTTP_THREADPOOL_MAX_SIZE}
    ${ASADMIN} stop-domain ${GLASSFISH_DOMAIN}
echo "* stop server glassfish."
    # Persist setup execution to avoid it to be re-run
    #touch ${INIT_MARKER_FILE}
    echo "* creation connection pool... Done."
}

# Main entry point
function main() {
	local ASADMIN_PATH =/glassfish5/bin/asadmin
    # Check if setup has already been done, and if not, then execute it
    #if [ ! -f ${INIT_MARKER_FILE} ]; then
        #setup
        ${ASADMIN} start-domain ${GLASSFISH_DOMAIN}
    #    deploy
    #else
    #    echo "* Cerberus is already deployed to the Glassfish instance. Skip installation."
    #fi
}

# Execute the main entry point
main

# Finally continue execution
exec "$@"
