FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory contents
COPY . /var/www

# Copy .env file
COPY .env.example /var/www/.env

# Install dependencies
RUN composer install

RUN composer update --ignore-platform-reqs

RUN mkdir -p /var/www/database && \
    touch /var/www/database/database.sqlite && \
    chmod 664 /var/www/database/database.sqlite && \
    chown www-data:www-data /var/www/database/database.sqlite && chmod 777 /var/www/database/database.sqlite

# Generate key
RUN php artisan key:generate

RUN php artisan migrate --force

# Expose port 8000 and start php server
EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000

CMD ["/bin/bash", "-c", "/var/www/start.sh"]

COPY ./database/database.sqlite /var/www/database/database.sqlite




