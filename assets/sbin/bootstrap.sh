#!/bin/bash

setcap 'cap_net_bind_service=+ep' /usr/sbin/in.tftpd
sleep 1
