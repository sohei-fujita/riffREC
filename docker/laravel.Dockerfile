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
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# PHP extensions (Non-standard)
RUN pecl install grpc && docker-php-ext-enable grpc \
    && pecl install imagick && docker-php-ext-enable imagick \
    && pecl install protobuf && docker-php-ext-enable protobuf \
    && pecl install xdebug && docker-php-ext-enable xdebug

# Redis extension
RUN git clone -b 5.3.4 --depth 1 https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis

# PHP extensions (Standard)
RUN docker-php-ext-install \
    gd \
    opcache \
    pdo_mysql \
    redis \
    && docker-php-ext-configure gd --with-freetype --with-jpeg

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

# Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs

# npm
RUN npm install -g npm@latest

RUN rm -rf /var/cache/apk/*

WORKDIR /usr/share/nginx/html
