# Build stage
FROM php:8.2-fpm AS build
WORKDIR /var/www/html
RUN apt-get update \
  && apt-get install -y zip unzip curl git libpng-dev libonig-dev libxml2-dev libzip-dev \
  && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY . .
RUN composer install --no-dev --optimize-autoloader \
  && cp .env.example .env \
  && php artisan key:generate

  # After app build/copy stage

COPY docker/nginx/nginx-site.conf /etc/nginx/conf.d/default.conf


# Final stage
FROM nginx:alpine
WORKDIR /var/www/html
COPY --from=build /var/www/html /var/www/html
COPY ./docker/nginx/nginx-site.conf /etc/nginx/conf.d/default.conf
RUN chown -R www-data:www-data /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
