FROM ghcr.io/linuxserver/baseimage-rdesktop-web:focal

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

RUN \
  echo "**** install packages ****" && \
  apt update && \
  DEBIAN_FRONTEND=noninteractive \
  sudo apt install --no-install-recommends -y software-properties-common apt-transport-https wget && \
  wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - && \
  add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" && \
  apt update && \
  apt-get install --no-install-recommends -y \
    code \
    firefox \
    mousepad \
    xfce4-terminal \
    xfce4 \
    xubuntu-default-settings \
    xubuntu-icon-theme && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3000
VOLUME /config
