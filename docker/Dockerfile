FROM ghcr.io/shadowsocks/ssserver-rust:latest

WORKDIR /home

RUN apk add bash make git go gettext

RUN git clone https://github.com/cbeuw/Cloak && \
	cd Cloak && \
	go get ./... && \
	make

WORKDIR /home/Cloak/build

COPY configure.sh configure.sh
COPY config.json.template config.json.template

RUN chmod 777 /home

CMD ["bash", "-c", "./configure.sh && ssserver --log-without-time -a nobody -c /etc/shadowsocks-rust/config.json"]
