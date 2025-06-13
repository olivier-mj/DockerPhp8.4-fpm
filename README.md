# DockerPhp8.4-fpm

Image Docker basée sur PHP 8.4-fpm avec des outils et extensions utiles pour le développement web moderne.

## 📋 Outils inclus

- **wget** - Téléchargement de fichiers
- **git** - Gestion de versions
- **nano/vim** - Éditeurs de texte
- **composer** - Gestionnaire de dépendances PHP
- **symfony-cli** - Interface en ligne de commande Symfony
- **ffmpeg** - Traitement audio/vidéo

## 🔧 Extensions PHP

- **zip** - Compression/décompression d'archives
- **intl** - Internationalisation
- **imagick** - Traitement d'images avancé
- **xdebug** - Débogage et profilage
- **pdo, pdo_mysql** - Base de données
- **gd** - Manipulation d'images de base
- **exif** - Métadonnées d'images

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
# Construire l'image
docker build -t php84-fpm .

# Lancer le conteneur
docker run -d -p 9000:9000 -v $(pwd):/var/www php84-fpm
```

---

# DockerPhp8.4-fpm (English)

Docker image based on PHP 8.4-fpm with useful tools and extensions for modern web development.

## 📋 Included Tools

- **wget** - File downloader
- **git** - Version control system
- **nano/vim** - Text editors
- **composer** - PHP dependency manager
- **symfony-cli** - Symfony command line interface
- **ffmpeg** - Audio/video processing

## 🔧 PHP Extensions

- **zip** - Archive compression/decompression
- **intl** - Internationalization
- **imagick** - Advanced image processing
- **xdebug** - Debugging and profiling
- **pdo, pdo_mysql** - Database support
- **gd** - Basic image manipulation
- **exif** - Image metadata

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
# Build the image
docker build -t php84-fpm .

# Run the container
docker run -d -p 9000:9000 -v $(pwd):/var/www php84-fpm
