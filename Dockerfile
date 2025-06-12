# Basé sur votre image existante
FROM php:8.4-fpm

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    libicu-dev \
    unzip \
    git \
    curl \
    wget \
    zip \
    vim \
    # Installation de FFmpeg - AJOUTEZ CES LIGNES
    ffmpeg \
    # Fin des ajouts pour FFmpeg
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip pdo pdo_mysql exif intl

# Installez vos autres extensions PHP et configurations selon vos besoins

# Vérifiez que FFmpeg est bien installé
RUN ffmpeg -version

# Configuration de PHP
COPY php.ini /usr/local/etc/php/conf.d/custom.ini

# Répertoire de travail
WORKDIR /var/www

# Utilisateur
RUN usermod -u 1000 www-data

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Symfony tool
RUN wget https://get.symfony.com/cli/installer -O - | bash && \
	mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Security checker tool
RUN curl -L https://github.com/fabpot/local-php-security-checker/releases/download/v${PHP_SECURITY_CHECHER_VERSION}/local-php-security-checker_${PHP_SECURITY_CHECHER_VERSION}_linux_$(dpkg --print-architecture) --output /usr/local/bin/local-php-security-checker && \
	chmod +x /usr/local/bin/local-php-security-checker

# Xdebug (disabled by default, but installed if required)
RUN pecl install xdebug-3.3.2 && docker-php-ext-enable xdebug
ADD php.ini /usr/local/etc/php/conf.d/

# Exposer le port
EXPOSE 9000

CMD ["php-fpm"]