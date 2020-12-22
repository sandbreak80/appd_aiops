FROM openjdk:8

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget zip vim curl -y


COPY apache-jmeter-5.4.zip /tmp
RUN unzip /tmp/apache-jmeter-5.4.zip -d /opt

COPY teastore_pod.jmx /opt/apache-jmeter-5.4
#COPY entry.sh /opt/apache-jmeter-5.4


WORKDIR /opt/apache-jmeter-5.4
#RUN chmod +x entry.sh
#RUN ./entry.sh

RUN /opt/apache-jmeter-5.4/bin/jmeter -n -t /opt/apache-jmeter-5.4/teastore_pod.jmx -l /opt/apache-jmeter-5.4/test_output.log \
-Jhostname=e088586b-bhteastore-teasto-900b-1659809752.us-east-1.elb.amazonaws.com \
-Jport=80 \
-JnumUser=10 \
-JrampUp=60 \
-JloopCount=10
