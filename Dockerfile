FROM debian:jessie
RUN apt-get update && apt-get -y wget
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev libssl-dev perl make build-essential

WORKDIR /tmp/
RUN wget -q https://openresty.org/download/openresty-1.9.7.4.tar.gz \
        && tar -xzf openresty-1.9.7.4.tar.gz \
        && rm -rf openresty-1.9.7.4.tar.gz

RUN rm -rf /opt/penresty && mkdir /opt/penresty

WORKDIR /tmp/openresty-1.9.7.4
RUN ./configure --prefix=/opt/penresty --with-pcre-jit
RUN make && make install
