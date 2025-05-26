# Import php:apache
FROM php:8.2-apache

# Enable Apache
RUN a2enmod rewrite

# Isikan db
COPY ./mysql_conf/database.sql /docker-entrypoint-initdb.d/init.sql

# Instal Mysql
RUN docker-php-ext-install mysqli pdo_mysql pdo