FROM alpine:3.14

RUN apk add --update --no-cache file=latest make=latest gcc=latest \
    g++=latest python3=latest wget=latest linux-headers=latest openssl-dev=latest \
    lzo-dev=latest linux-pam-dev=latest git=latest sudo=latest make=latest cmake=latest \
	valgrind=latest vim=latest bash=latest \
    && apk upgrade --available --no-cache
