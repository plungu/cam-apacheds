FROM openjdk:11

RUN apt-get update && apt-get install -y xinetd ldap-utils gettext-base

ADD http://archive.apache.org/dist/directory/apacheds/dist/2.0.0.AM25/apacheds-2.0.0.AM25-amd64.deb /tmp/installer.deb

RUN dpkg -i /tmp/installer.deb
RUN mkdir /ldifs

# COPY ldifs/* /ldifs/
COPY conf/wrapper.conf /opt/apacheds-2.0.0.AM25/conf

EXPOSE 10389 10636 11001

COPY scripts/* /root/

ENTRYPOINT ["/root/start.sh"]
