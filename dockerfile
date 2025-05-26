FROM php:8.2-apache

# Install Node.js
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install dependensi PHP
RUN a2enmod rewrite
RUN docker-php-ext-install mysqli pdo_mysql pdo

# Copy file aplikasi Node.js
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

# Copy file PHP ke direktori Apache
COPY . /var/www/html/

# Copy database.sql (opsional, biasanya untuk container database)
COPY ./mysql_conf/database.sql /docker-entrypoint-initdb.d/init.sql

# Install supervisord untuk menjalankan dua service
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 5500

CMD ["/usr/bin/supervisord"]