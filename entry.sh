#!/usr/bin/env bash
/opt/apache-jmeter-5.4/bin/jmeter -n -t /opt/apache-jmeter-5.4/teastore_pod.jmx -l /opt/apache-jmeter-5.4/test_output.log \
-Jhostname=e088586b-bhteastore-teasto-900b-1659809752.us-east-1.elb.amazonaws.com \
-Jport=80 \
-JnumUser=10 \
-JrampUp=60 \
-JloopCount=10
