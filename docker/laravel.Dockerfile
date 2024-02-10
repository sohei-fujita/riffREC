FROM php:8.2-fpm

#Debian
RUN apt-get update && apt-get install -y \
  autoconf \
  bash \
  build-essential \
  curl \
  g++ \
  git \
