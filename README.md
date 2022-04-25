# Inception (42 Network)

This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

## General guidelines

* This project is done on a Virtual Machine (Ubuntu 20.04.4 LTS).
* All the files required for the configuration of the project are placed in a srcs folder.
* A Makefile to set up the entire application (i.e., it build the Docker images using docker-compose.yml).
* Bullet list

## Mandatory part

* Nginx: A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
* WordPress: A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
* Mariadb: A Docker container that contains MariaDB only without nginx.
* Redis: A Docker container that contains redis cache for WordPress website in order to properly manage the cache.
* Adminer: A Docker container that contains adminer where you can manage your databse.
* ftp-server: A Docker container that contains FTP server pointing to the volume of your WordPress website.
* cAdvisor: A Docker container that contains cAdvisor analyzes and exposes resource usage and performance data from running containers.
* Website: A Docker container that serve a showcase website.
