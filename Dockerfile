FROM	alpine:3.14

RUN		apk add --update --no-cache \
    file \
    make \
    gcc \
    g++ \
    python3 \
    wget \
    linux-headers \
    openssl-dev \
    lzo-dev \
    linux-pam-dev

RUN		apk add --update --no-cache git \
		sudo \
		make \
		cmake \
		valgrind \
		vim \
        bash
