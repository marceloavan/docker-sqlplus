FROM sflyr/ubuntu
MAINTAINER sflyr

RUN apt-get -y update
RUN apt-get -y install libaio1 unzip rlwrap
ADD instantclient-basic-linux.x64-12.2.0.1.0.zip /
ADD instantclient-sqlplus-linux.x64-12.2.0.1.0.zip /
ADD instantclient-sdk-linux.x64-12.2.0.1.0.zip /
ADD instantclient-jdbc-linux.x64-12.2.0.1.0.zip /
RUN unzip instantclient-basic-linux.x64-12.2.0.1.0.zip
RUN unzip instantclient-sqlplus-linux.x64-12.2.0.1.0.zip
RUN unzip instantclient-sdk-linux.x64-12.2.0.1.0.zip
RUN unzip instantclient-jdbc-linux.x64-12.2.0.1.0.zip

ENV LD_LIBRARY_PATH /instantclient_12_2

CMD sleep 1; rlwrap /instantclient_12_2/sqlplus $URL
