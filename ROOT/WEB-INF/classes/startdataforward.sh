JAVA_HOME=/usr/java5
JAVACMD=java
RUN_BIN=/home/bf/bin/bfdataforward
TMPCLASSPATH='';

cd $RUN_BIN

CLASSPATH=$RUN_BIN:$TMPCLASSPATH$CLASSPATH
PATH=$JAVA_HOME/jre/bin:$PATH

echo $CLASSPATH

export CLASSPATH=$CLASSPATH
/usr/java5/bin/java -Dfile.encoding=GBK DataForward
