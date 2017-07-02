Asterisk PBX Docker image
=========================

Small Docker image with Asterisk PBX 

Based on https://hub.docker.com/r/andrius/alpine-asterisk/

What's missing
---------------

Only base Asterisk packages installed with some sounds. However you may install additional packages with `apk` command:

- asterisk-alsa
- asterisk-srtp
- asterisk-curl
- asterisk-tds
- asterisk-mobile
- asterisk-dahdi
- asterisk-fax
- asterisk-pgsql
- asterisk-odbc

Database support
----------------

By default, Asterisk PBX strre CDR's to the CSV file, but also support databases. Refer Asterisk PBX documentation for ODBC support. 

For Postgre SQL include following lines to your Dockerfile:

```bash
RUN apk add --update less psqlodbc asterisk-odbc asterisk-pgsql \
&&  rm -rf /var/cache/apk/*
```

And For MySQL:

```bash
RUN apk add --update psqlodbc asterisk-odbc \
&&  apk add mysql-connector-odbc --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
&&  rm -rf /var/cache/apk/*
```

Mount config volume
-------------------
use docker run  -v option like: 
-v $(pwd)/test/example/:/etc/asterisk/ 
