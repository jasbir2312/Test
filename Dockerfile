FROM centos:7

#Install Utilities
RUN yum -y install git

#Install Oracle JDK
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie' && rpm -i jdk-8u131-linux-x64.rpm
ENV JAVA_HOME /usr/java/jdk1.8.0_131

# Install App
RUN git clone https://github.com/jasbir2312/demo.git /opt/my-app
RUN whoami
RUN cd /opt/my-app && ./mvnw clean install

# Service to run
CMD cd /opt/my-app && ./mvnw spring-boot:run
