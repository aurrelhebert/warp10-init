#
# User variables
#

# Warp version number
WARP10_REVISION=2.0.2-44

# Warp 10 user home
WARP10_HOME=/Path/to/warp10/warp10-$WARP10_REVISION/

# JAVA 8 user path
JAVA_8=/Path/to/jdk1.8.0_171/bin

#
# JAVA and leveldb parameters
#

# Warp 10 information extracted from WARP10-HOME and its REVISION
WARP10_DATA_DIR=${WARP10_HOME}
WARP10_GROUP=warp10
WARP10_CONFIG=${WARP10_HOME}/etc/conf-standalone.conf
WARP10_JAR=${WARP10_HOME}/bin/warp10-${WARP10_REVISION}.jar
WARP10_INIT=io.warp10.standalone.WarpInit

# LOAD Warp 10 conf in classpass and all user defined functions or extensions put in LIB directory
WARP10_CP=${WARP10_HOME}/etc:${WARP10_JAR}

# Set local JAVA properties
WARP10_HEAP=1g
WARP10_HEAP_MAX=1g

# Set LEVELDB HOME
LEVELDB_HOME=${WARP10_DATA_DIR}/leveldb

# Test repo
echo "${LEVELDB_HOME}"

# Set logger conf
LOG4J_CONF=${WARP10_HOME}/etc/log4j.properties
JAVA_HEAP_DUMP=${WARP10_HOME}/logs/java.heapdump

#
# Start LEVELDB init 
#

JAVA_OPTS="-Djava.awt.headless=true -Dlog4j.configuration=file:${LOG4J_CONF} -Xms${WARP10_HEAP} -Xmx${WARP10_HEAP_MAX} -XX:+UseG1GC"
$JAVA_8/java ${JAVA_OPTS} -cp ${WARP10_CP} ${WARP10_INIT} ${LEVELDB_HOME}