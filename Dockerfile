FROM debian:jessie
RUN apt-get update && apt-get install -y wget
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential

RUN rm -rf /opt/penresty && mkdir /opt/penresty

WORKDIR /tmp/
RUN wget -q https://openresty.org/download/openresty-1.9.7.4.tar.gz \
        && tar -xzf openresty-1.9.7.4.tar.gz \
        && /tmp/openresty-1.9.7.4 \
        && ./configure --prefix=/opt/penresty --with-pcre-jit \
        && rm -rf openresty-1.9.7.4.tar.gz \
        && make && make install
