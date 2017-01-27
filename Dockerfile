FROM lsiobase/alpine.nginx
MAINTAINER chbmb

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# package version
ARG LYCHEE_VERSION="3.1.5"

# install packages
RUN \
 apk add --no-cache \
 	php5-curl \
	php5-exif \
	php5-gd \
	php5-imagick \
	php5-mysqli \
	php5-mysql \
	php5-zip 
	
# install build packages
RUN \
 apk add --no-cache --virtual=build-dependencies \
 	curl \
	
# install lychee
RUN \

 mkdir -p \
	/usr/share/webapps/lychee && \
 curl -o \
 /tmp/lychee.tar.gz -L \
	https://github.com/electerious/Lychee/archive/v${LYCHEE_VERSION}.tar.gz && \
 tar xf \
 /tmp/lychee.tar.gz -C \
	/usr/share/webapps/lychee --strip-components=1 && \
	
# cleanup
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*
	
# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config
