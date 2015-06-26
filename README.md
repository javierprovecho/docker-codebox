# docker-codebox
Dockerfile for running Codebox Web IDE.

## Simple start

    docker run -P javierprovecho/docker-codebox

Then look up the port at:

    docker ps | grep javierprovecho/docker-codebox

## How to change the port

	docker run -p 8000:8000 javierprovecho/docker-codebox

## How to protect with user/password

	docker run -P javierprovecho/docker-codebox -u user:pass

## How to launch in Giant Swarm

	swarm login
	swarm up --var=user=youruser --var=pass=yourpass

Where `user` is your Giant Swarm username, which is needed for domain
mapping, and `pass` is a random pass you choose. After Giant Swarm has
started your app, login with your Giant Swarm username and your
choosen password.