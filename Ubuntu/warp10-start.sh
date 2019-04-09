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
# Load Warp 10 jar, quantum plugin and Warp 10 config
#

WARP10_JAR=$WARP10_HOME/bin/warp10-$WARP10_REVISION.jar:$WARP10_HOME/bin/warp10-quantum-plugin-$QUANTUM_REVISION.jar
WARP10_CONFIG=$WARP10_HOME/etc/warp10.conf

#
# Start Warp 10 plateform
#

$JAVA_8/java -cp ${WARP10_JAR} io.warp10.standalone.Warp ${WARP10_CONFIG}