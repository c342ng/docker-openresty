FROM debian:jessie
RUN apt-get update && apt-get install -y wget vim
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential

RUN rm -rf /opt/openresty && mkdir /opt/openresty

WORKDIR /tmp/
RUN wget -q https://openresty.org/download/openresty-1.9.7.4.tar.gz \
        && tar -xzf openresty-1.9.7.4.tar.gz \
        && cd /tmp/openresty-1.9.7.4 \
        && ./configure --prefix=/opt/openresty --with-pcre-jit \
        && make && make install \
        && rm -rf /tmp/openresty*
RUN rm -rf /var/lib/apt/lists/*
