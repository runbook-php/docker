FROM alpine:3.14

RUN apk add --no-cache \
    php7 \
    php7-cli \
    php7-json \
    php7-openssl \
    php7-phar \
    php7-dom \
    php7-xml \
    php7-tokenizer \
    php7-ctype \
    php7-mbstring \
    php7-curl \
    curl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
