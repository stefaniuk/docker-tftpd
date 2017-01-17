FROM stefaniuk/ubuntu:16.04-20170117

ARG APT_PROXY
ARG APT_PROXY_SSL
ENV TFTPD_HPA_VERSION="5.2" \
    RUN_AS="root"

RUN set -ex \
    \
    && if [ -n "$APT_PROXY" ]; then echo "Acquire::http { Proxy \"http://${APT_PROXY}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && if [ -n "$APT_PROXY_SSL" ]; then echo "Acquire::https { Proxy \"https://${APT_PROXY_SSL}\"; };" > /etc/apt/apt.conf.d/00proxy; fi \
    && apt-get --yes update \
    && apt-get --yes install \
        tftp tftpd-hpa=${TFTPD_HPA_VERSION}* \
    \
    && setcap 'cap_net_bind_service=+ep' /usr/sbin/in.tftpd \
    \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/* \
    && rm -f /etc/apt/apt.conf.d/00proxy

WORKDIR /var/lib/tftpboot
VOLUME [ "/var/lib/tftpboot" ]
EXPOSE 69/udp

COPY assets/sbin/bootstrap.sh /sbin/bootstrap.sh
CMD [ "/usr/sbin/in.tftpd", "--listen", "--user", "root", "--address", "0.0.0.0:69", "--secure", "/var/lib/tftpboot" ]

### METADATA ###################################################################

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL \
    version=$VERSION \
    build-date=$BUILD_DATE \
    vcs-ref=$VCS_REF \
    vcs-url=$VCS_URL \
    license="MIT"
