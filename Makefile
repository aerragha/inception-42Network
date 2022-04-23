NAME = inception

SRC = ./srcs/


all: fclean setup

folders:
	@ mkdir -p /Users/aerragha/goinfre/data/mariadb
	@ mkdir -p /Users/aerragha/goinfre/data/website

setup:
	@ cd $(SRC) && docker-compose up -d --build

start:
	@ cd $(SRC) && docker-compose up -d;

stop:
	@ cd $(SRC) && docker-compose down;

ls:
	@ cd $(SRC) && docker-compose ps;

restart: stop start

reload: stop setup

clean: stop
	@ cd $(SRC) && docker system prune -f;

fclean: clean
	@ cd $(SRC) && docker system prune -a -f;
	@ cd $(SRC) docker volume prune

purge: fclean
	@ rm -rf /Users/aerragha/goinfre/data/*;
