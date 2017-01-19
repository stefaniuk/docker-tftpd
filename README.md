[![Circle CI](https://circleci.com/gh/stefaniuk/docker-tftpd.svg?style=shield "CircleCI")](https://circleci.com/gh/stefaniuk/docker-tftpd)&nbsp;[![Size](https://images.microbadger.com/badges/image/stefaniuk/tftpd.svg)](http://microbadger.com/images/stefaniuk/tftpd)&nbsp;[![Version](https://images.microbadger.com/badges/version/stefaniuk/tftpd.svg)](http://microbadger.com/images/stefaniuk/tftpd)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/stefaniuk/tftpd.svg)](http://microbadger.com/images/stefaniuk/tftpd)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/stefaniuk/tftpd.svg)](https://hub.docker.com/r/stefaniuk/tftpd/)

Docker TFTPd
============

[Trivial File Transfer Protocol server](https://linux.die.net/man/8/tftpd) is a simple file transfer protocol which allows a client to get a file from or put a file onto a remote host. It can be used to support network booting, firmware upgrades and debricking devices.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/stefaniuk/tftpd/).

    docker pull stefaniuk/tftpd

Alternatively you can build the image yourself.

    docker build --tag stefaniuk/tftpd \
        github.com/stefaniuk/docker-tftpd

Testing
-------

    make build start bash

Quickstart
----------

```bash
    $ docker run --rm -it \
        -v $(pwd):/var/lib/tftpboot \
        -p 69:6900/udp \
        stefaniuk/tftpd
    $ tftp 172.17.0.1
    tftp> put fileName newName
    Sent 1234 bytes in 0.0 seconds
    tftp> q
    $ ls -la
    drwxrwxrwx 2 user user 4096 Jan 1 00:00 .
    drwxrwxr-x 9 user user 4096 Jan 1 00:00 ..
    -rw-rw-r-- 1 user user 1234 Jan 1 00:00 fileName
    -rw-rw-r-- 1 user user 1234 Jan 1 00:01 newName
```
