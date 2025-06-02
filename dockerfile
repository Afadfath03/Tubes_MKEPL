FROM php:8.2-apache

RUN a2enmod rewrite

COPY ./mysql_conf/database.sql /docker-entrypoint-initdb.d/init.sql

RUN docker-php-ext-install mysqli pdo_mysql pdo