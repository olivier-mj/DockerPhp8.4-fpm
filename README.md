# DockerPhp8.4-fpm

Image Docker basée sur PHP 8.4-fpm avec des outils et extensions utiles pour le développement web moderne.

## 📋 Outils inclus

- **curl / wget** - Téléchargements HTTP(S)
- **git** - Gestion de versions
- **vim** - Éditeur de texte en console
- **zip / unzip** - Compression et extraction
- **composer** - Gestionnaire de dépendances PHP (copié depuis l'image officielle `composer:2`)
- **symfony-cli** - Interface en ligne de commande Symfony
- **ffmpeg** - Traitement audio/vidéo

## 🔧 Extensions PHP

- **apcu** - Cache utilisateur
- **exif** - Métadonnées d'images
- **gd** - Manipulation d'images de base
- **imagick** - Traitement d'images avancé
- **intl** - Internationalisation
- **pdo, pdo_mysql** - Base de données
- **redis** - Client Redis pour PHP
- **xdebug** - Débogage et profilage
- **zip** - Compression/décompression d'archives
- **opcache** - Accélérateur d'opcodes

## 🔐 Audit de sécurité

⚠️ **Important** : L'outil `php-security-checker` a été archivé par son mainteneur.

**Solution recommandée** : Utilisez la commande intégrée de Composer :

```bash
# Audit des dépendances pour détecter les vulnérabilités
composer audit

# Audit avec format JSON pour intégration CI/CD
composer audit --format=json

# Audit avec niveau de sévérité minimum
composer audit --min-severity=high
```

> Cette fonctionnalité est disponible depuis Composer 2.4+ et est directement intégrée dans l'image Docker.

## 🚀 Utilisation

```bash
# Construire l'image localement
docker build -t php84-fpm .

# Vérifier les extensions chargées
docker run --rm php84-fpm php -m | grep -E 'apcu|imagick|redis|xdebug'

# Lancer le conteneur pour le développement
docker run -d -p 9000:9000 -v $(pwd):/var/www php84-fpm
```

> Astuce CI/CD : configurez GitHub Actions avec `docker/build-push-action` pour construire et pousser l'image vers Docker Hub lors des pushes sur `main`.

---

# DockerPhp8.4-fpm (English)

Docker image based on PHP 8.4-fpm with useful tools and extensions for modern web development.

## 📋 Included Tools

- **curl / wget** - HTTP(S) downloads
- **git** - Version control system
- **vim** - Console text editor
- **zip / unzip** - Archive compression utilities
- **composer** - PHP dependency manager (sourced from the official `composer:2` image)
- **symfony-cli** - Symfony command line interface
- **ffmpeg** - Audio/video processing

## 🔧 PHP Extensions

- **apcu** - User caching
- **exif** - Image metadata
- **gd** - Basic image manipulation
- **imagick** - Advanced image processing
- **intl** - Internationalization
- **pdo, pdo_mysql** - Database support
- **redis** - Redis client for PHP
- **xdebug** - Debugging and profiling
- **zip** - Archive compression/decompression
- **opcache** - Opcode caching

## 🔐 Security Audit

⚠️ **Important**: The `php-security-checker` tool has been archived by its maintainer.

**Recommended solution**: Use Composer's built-in command:

```bash
# Audit dependencies for vulnerabilities
composer audit

# Audit with JSON format for CI/CD integration
composer audit --format=json

# Audit with minimum severity level
composer audit --min-severity=high
```

> This functionality is available since Composer 2.4+ and is directly integrated into the Docker image.

## 🚀 Usage

```bash
# Build the image locally
docker build -t php84-fpm .

# Inspect loaded extensions
docker run --rm php84-fpm php -m | grep -E 'apcu|imagick|redis|xdebug'

# Run the container for development
docker run -d -p 9000:9000 -v $(pwd):/var/www php84-fpm
```

> CI/CD tip: wire up GitHub Actions with `docker/build-push-action` to build and push the image to Docker Hub whenever `main` is updated.
