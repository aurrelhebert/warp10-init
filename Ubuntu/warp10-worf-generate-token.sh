#
# User variables
#

# Warp 10 app
APPLICATION_NAME=test

# Token expiracy TTL stands for (time to live) in ms
TTL=7776000000

# Warp and Quantum version number
WARP10_REVISION=2.0.2-44
QUANTUM_REVISION=3.0.3

# Warp 10 user home
WARP10_HOME=/Path/to/warp10/warp10-$WARP10_REVISION/

# JAVA 8 user path
JAVA_8=/Path/to/jdk1.8.0_171/bin

#
# Load Warp 10 jar and Warp 10 config
#

WARP10_JAR=$WARP10_HOME/bin/warp10-$WARP10_REVISION.jar
WARP10_CONFIG=$WARP10_HOME/etc/warp10.conf

#
# Start worf
#

$JAVA_8/java -cp ${WARP10_JAR} io.warp10.worf.Worf ${WARP10_CONFIG} -puidg -t -a $APPLICATION_NAME -ttl $TTL