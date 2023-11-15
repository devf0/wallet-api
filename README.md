# README

This README would normally document whatever steps are necessary to get the
application up and running.

* Build
$ docker compose build
$ docker compose run --rm api rails db:create
$ docker compose run --rm api rails db:migrate
$ docker compose run --rm api rails db:seed
$ docker compose up -d
