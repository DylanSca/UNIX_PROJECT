FROM php:8.2-apache

RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install mysqli \
    && pecl install redis \
    && docker-php-ext-enable redis
