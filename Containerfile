FROM registry.access.redhat.com/ubi8/ubi:8.0
MAINTAINER Red Hat Training <training@redhat.com>
# DocumentRoot for Apache
ENV DOCROOT=/var/www/html 
RUN yum install -y --no-docs --disableplugin=subscription-manager httpd && \ 
  yum clean all --disableplugin=subscription-manager -y && \
echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html
EXPOSE 80
# Launch httpd
CMD /usr/sbin/httpd -DFOREGROUND
