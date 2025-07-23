FROM php:8.2-fpm

WORKDIR /var/www

RUN apt-get update \
  && apt-get install -y zip unzip curl git libpng-dev libonig-dev libxml2-dev libzip-dev \
  && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

  RUN mkdir -p /var/www/database && touch /var/www/database/database.sqlite
  RUN  touch database/database.sqlite

RUN docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd zip

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg-dev \
    libpng-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) gd exif \
 && docker-php-ext-enable gd \
 && rm -rf /var/lib/apt/lists/*


COPY . /var/www
COPY --chown=www-data:www-data . /var/www

RUN chmod -R 755 /var/www
RUN composer install

COPY .env.example .env
RUN php artisan key:generate


EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000


COPY scripts/00-laravel-deploy.sh /deploy.sh
RUN chmod +x /deploy.sh

CMD ["/deploy.sh"]
