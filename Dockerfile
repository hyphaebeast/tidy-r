FROM rocker/r-ubuntu:20.04

RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    libatomic1 \
    libreadline-dev \
    ca-certificates \
    lzip \
    libffi-dev \
    libssl-dev \
    gfortran \
    autoconf \
    wget \
    unzip \
    m4 \
    cmake \
    gcc \
    gcc-arm-none-eabi \
    cppcheck \
    vera++ \
    libcurl4-openssl-dev \
    pkg-config \
    ubuntu-dev-tools \
    software-properties-common \
    apt-transport-https \
    curl \
    git \
    nano \
    bison \
    default-jre \
    libxml2-dev \
    #libcairo2-dev \
    #libsqlite-dev \
    #libmariadbd-dev \
    #libmariadbclient-dev \
    #libpq-dev \
    #libssh2-1-dev \
    #unixodbc-dev \
    #libsasl2-dev \
    && update-ca-certificates \
    && install2.r --skipinstalled --ncpus 2 --error \
     --deps TRUE \
     dplyr \
     tidyr \
     readr \
     janitor \
     glue \
     lubridate \
     readxl \
     jsonlite \
     zoo \
     openssl \
     vroom \
     aws.s3 \
     httr
      
RUN mkdir -p /usr/local/share/ca-certificates
COPY dshs.crt /usr/local/share/ca-certificates/dshs.crt
RUN update-ca-certificates

#RUN sudo curl http://curl.haxx.se/ca/cacert.pem --output /etc/ssl/certs/cacert.pem
ENTRYPOINT ["/bin/sh", "-c", "bash"] 