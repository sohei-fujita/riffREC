FROM php:8.2-fpm

#Debian
RUN apt-get update && apt-get install -y \
    autoconf \
    bash \
    build-essential \
    curl \
    g++ \
    git \
    imagemagick libmagickwand-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    make \
    openssl \
    unzip \
    zip \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
