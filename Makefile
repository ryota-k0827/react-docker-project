container_name := react-docker-project
dc := docker compose
de := docker exec -it

init:
	cp .env.sample .env.development.local
	# code --install-extension esbenp.prettier-vscode
	# code --install-extension dbaeumer.vscode-eslint
	# code --install-extension streetsidesoftware.code-spell-checker
	$(MAKE) build up-d

build:
	$(dc) build --no-cache

up:
	$(dc) up

up-d:
	$(dc) up -d

down:
	$(dc) down

de:
	$(de) $(container_name) sh

y/install:
	$(de) $(container_name) sh -c "yarn install"
	docker container cp $(container_name):/app/node_modules $(PWD)

y/add:
	$(de) $(container_name) sh -c "yarn add $(p)"
	docker container cp $(container_name):/app/node_modules $(PWD)

y/add-D:
	$(de) $(container_name) sh -c "yarn add -D $(p)"
	docker container cp $(container_name):/app/node_modules $(PWD)

y/remove:
	$(de) $(container_name) sh -c "yarn remove $(p)"
	docker container cp $(container_name):/app/node_modules $(PWD)

y/cache/clean:
	$(de) $(container_name) sh -c "yarn cache clean"
	docker container cp $(container_name):/app/node_modules $(PWD)

y/outdated:
	$(de) $(container_name) sh -c "yarn outdated"

y/upgrade:
	$(de) $(container_name) sh -c "yarn upgrade $(p)"
	docker container cp $(container_name):/app/node_modules $(PWD)

y/info:
	$(de) $(container_name) sh -c "yarn info $(p)"

modules/cp:
	docker container cp $(container_name):/app/node_modules $(PWD)

rm/modules:
	rm -rf node_modules

rm/build:
	rm -rf dist
	rm -rf storybook-static
	rm -rf build-storybook.log

open/web:
	open http://localhost:3000

help:
	cat ./docs/make-help.txt