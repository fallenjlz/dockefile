FROM busybox:latest
MAINTAINER "llo <llo@gmail.com>"
ENV DOC_ROOT=/data/web/html/\
	WEB_SERVER_PACKAGE="nginx-1.16.0"

COPY index.html ${DOC_ROOT}
COPY yum.repos.d /etc/yum.repos.d/
WORKDIR /usr/local/
ADD http://nginx.org/download/${WEB_SERVER_PACKAGE}.tar.gz ./src/
VOLUME /data/vs
EXPOSE 8086:80/tcp
RUN cd ./src &&\
	tar zxf ${WEB_SERVER_PACKAGE}.tar.gz
#CMD /bin/httpd -f -h ${DOC_ROOT}
ENTRYPOINT /bin/httpd -f -h ${DOC_ROOT}


