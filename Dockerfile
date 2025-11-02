FROM php:8.4-fpm

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        curl \
        ffmpeg \
        git \
        unzip \
        vim \
        wget \
        zip \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
        libzip-dev \
        libmagickwand-dev \
        pkg-config; \
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp; \
    docker-php-ext-install -j"$(nproc)" \
        exif \
        gd \
        intl \
        pdo \
        pdo_mysql \
        zip; \
    pecl install imagick apcu redis xdebug-3.4.4; \
    docker-php-ext-enable imagick apcu redis xdebug opcache; \
    apt-get autoremove -y --purge; \
    rm -rf /var/lib/apt/lists/*

RUN ffmpeg -version

COPY php.ini /usr/local/etc/php/conf.d/custom.ini

WORKDIR /var/www

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN curl -fsSL https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony*/bin/symfony /usr/local/bin/symfony && \
    rm -rf /root/.symfony*

EXPOSE 9000

CMD ["php-fpm"]
