FROM ghcr.io/shadowsocks/ssserver-rust:latest

RUN apk update && \
    apk add gcc autoconf make libtool automake zlib-dev openssl asciidoc xmlto libpcre32 libev-dev g++ linux-headers git

RUN git clone https://github.com/shadowsocks/simple-obfs.git && \
	cd simple-obfs && \
	git submodule update --init --recursive && \
	./autogen.sh && \
	./configure && make && \
	make install
