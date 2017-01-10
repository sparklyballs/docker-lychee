FROM lsiobase/alpine.nginx
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	php-exif \
	php-gd \
	php-mysqli \
	php-zip

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config