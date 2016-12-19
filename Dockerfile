FROM composer:latest

RUN mkdir -p /app
WORKDIR /app
ADD composer.json composer.json
ADD composer.lock composer.lock
ADD web web
ADD src src

RUN composer install

EXPOSE 8080
ENTRYPOINT php -S 0.0.0.0:8080 -t web web/index.php
