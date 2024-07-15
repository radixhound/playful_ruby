# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Things Todo

Day 2

### Move the person

- [x] render buttons to the page
- [x] send command to the server to move the person
- [ ] Player.update position player_controller CRUD
- [ ] Player.update(direction: "up")
- [ ]PlayerMovementIntentController#POST
- [x] store of the state of the person
- [x] send updates back to the screen to update the game board

Day 3

### Fix bugs, get artwork, cleanup

- [x] See if I can fix the multiple movement bug with locking
- [x] Finish the signup process and create a new player
- [x] Introduce artwork for the player
- [x] Add terrain for movement


## Starting the server locally

`docker-compose up`

## Getting into a console

`docker compose exec playful_ruby bash`
`bin/rails c`

## Reloading the game board

From a console:

`GameTile.delete_all`
`GameTile.generate(rows: 10, columns:10)`


