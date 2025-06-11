FROM alpine:3.14

ARG   SSH_PRIVATE_KEY=""

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
    php7-fileinfo \
    curl \
    openssh-client \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN   mkdir -m 700 ~/.ssh && \
      echo "$SSH_PRIVATE_KEY" |tr -d '\r' > ~/.ssh/id_rsa && \
      chmod 600 ~/.ssh/id_rsa && \
      ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts 

WORKDIR /app
