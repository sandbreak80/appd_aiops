FROM openjdk:8

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget zip vim curl -y


COPY apache-jmeter-5.4.zip /tmp
RUN unzip /tmp/apache-jmeter-5.4.zip -d /opt

COPY teastore_pod.jmx /opt/apache-jmeter-5.4

WORKDIR /opt/apache-jmeter-5.4

RUN /opt/apache-jmeter-5.4/bin/jmeter -n -t /opt/apache-jmeter-5.4/teastore_pod.jmx -l /opt/apache-jmeter-5.4/test_output.csv -JThreadNumber=10 -JRampUpPeriod=10 -Jiterations=10
