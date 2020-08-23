FROM rocker/r-ubuntu:20.04

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable

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
    pandoc

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev 

RUN update-ca-certificates 

RUN install2.r --skipinstalled --ncpus 2 --error \
     --deps TRUE \
     tidyverse \
     janitor \
     glue \
     lubridate \
     readxl \
     jsonlite \
     zoo \
     openssl \
     vroom \
     aws.s3 \
     httr \
     blogdown \
     colorspace \
     highcharter \
     gt \
     leaflet \
     leaflet.extras \
     sf \
     uuid

RUN R --no-save -e 'blogdown::install_hugo(force = TRUE)'
      
RUN mkdir -p /usr/local/share/ca-certificates
COPY dshs.crt /usr/local/share/ca-certificates/dshs.crt
COPY twc.crt /usr/local/share/ca-certificates/twc.crt
RUN update-ca-certificates

#RUN sudo curl http://curl.haxx.se/ca/cacert.pem --output /etc/ssl/certs/cacert.pem