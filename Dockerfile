FROM centos
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.82/bin/apache-tomcat-8.5.82.tar.gz
RUN tar xvfz  apache-tomcat-8.5.82.tar.gz
RUN mv apache-tomcat-8.5.82/* /opt/tomcat/.
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install java-1.8.0-openjdk -y
WORKDIR /opt/tomcat/webapps
RUN curl -O https://june22artifacts.s3.us-east-2.amazonaws.com/hello-15.war
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]