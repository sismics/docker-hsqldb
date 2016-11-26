#
# Dockerfile for HSQLDB 2.3.0
#
# Instructions:
#
# docker build -t sismics/hsqldb .
# docker run -d -p 9001:9001 --name hsqldb --volumes-from=hsqldb_data sismics/hsqldb
#
# Default user is admin/docker

# TODO
# http://hsqldb.org/doc/guide/running-chapt.html
# wget http://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_3/hsqldb-2.3.0.zip
# su hsqldb -c cd '/etc/hsqldb' && echo $$ > '/var/run/hsqldb.pid' && exec '/usr/bin/java' -Dhsqldb.method_class_names=""  -classpath '/usr/share/java/hsqldb.jar' org.hsqldb.util.MainInvoker org.hsqldb.Server

FROM sismics/debian-java:7.79.1
MAINTAINER benjamin.gam@gmail.com

# Download and install HSQLDB
RUN wget http://downloads.sourceforge.net/project/hsqldb/hsqldb/hsqldb_2_3/hsqldb-2.3.0.zip && \
    unzip hsqldb-2.3.0.zip && \
    mkdir -p /etc/hsqldb && \
    cp hsqldb-2.3.0/hsqldb/lib/hsqldb.jar /etc/hsqldb/

# Expose the HSQLDB port
EXPOSE 9001

# Set the default command to run when starting the container
CMD cd /etc/hsqldb && \
    java -Dhsqldb.method_class_names=\"\" \
    -Xmx512m \
    -cp hsqldb.jar org.hsqldb.Server \
    -database.0 file:/data/$DB_NAME \
    -dbname.0 $DB_NAME
