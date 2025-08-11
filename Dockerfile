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
    libmagickwand-dev \
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

# Installation de l'extension PHP ImageMagick
RUN pecl install imagick && docker-php-ext-enable imagick

# Installation d'APCu pour le cache utilisateur
RUN pecl install apcu && docker-php-ext-enable apcu

# Installation de l'extension Redis
RUN pecl install redis && docker-php-ext-enable redis

# Activation d'OPcache pour l'optimisation des performances
RUN docker-php-ext-enable opcache

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

# Symfony CLI - téléchargement avec curl
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

# Note: php-security-checker a été archivé, utiliser 'composer audit' à la place
# Cette commande est maintenant intégrée dans Composer (depuis la version 2.4)

# Xdebug (disabled by default, but installed if required)
RUN pecl install xdebug-3.4.4 && docker-php-ext-enable xdebug

# Exposer le port
EXPOSE 9000

CMD ["php-fpm"]