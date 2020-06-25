# tidy-r

This is the Docker image used in the Github Actions environment for [texas-2036/covid-data](https://github.com/texas-2036/covid-data). This autobuilds and updates the image whenever this repo receives a new commit.

## Usage

If you need to add a new R package to the environment, add the package name to the [install2.r](
https://github.com/hyphaebeast/tidy-r/blob/master/Dockerfile#L42) command in the Dockerfile.



```dockerfile
    ...
    
    #libsasl2-dev \
    && update-ca-certificates \
    && install2.r --skipinstalled --ncpus 2 --error \ 👈
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
➕   [new-package-name]

     ...
```
