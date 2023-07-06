FROM composer/composer:lts-bin as composer
FROM php:8.2-alpine

WORKDIR /srv

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY --from=composer /composer /usr/local/bin/composer

COPY composer.json composer.lock /srv/

RUN apk add $PHPIZE_DEPS && \
    docker-php-ext-configure pcntl --enable-pcntl && \
    docker-php-ext-install pcntl

RUN composer install && \
    composer global config minimum-stability dev && \
    composer global require 'phpactor/phpactor=2023.06.17-2'

COPY . .
