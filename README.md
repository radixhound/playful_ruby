# Playful Ruby

This little project started as a hackathon project where we were given time to work on whatever we wanted at work.

I discovered what I really wanted was to have fun writing code, so I came up with the idea to try to make the silliest game that I could using technologies that I wanted to spend more time using. In this case it was Turbo and Hotwire in Rails.

The end result is a hex-tile based game where you can move your avatar around the board using vim-like keybindings. It's a mindbender since instead of four directions there are six. The main difference from vim is that there are additional keys to make your avatar face either left or right, and based on which direction you are facing you will either go up to the left and down to the right, or up to the right and down to the left.

As I was running out of time, I had to implement a simple game mechanic and so I added a multiplayer element and turned it into a game of tag. If you land on someone else's tile then you tag them and they warp to a random place on the board. It's a bit of frantic fun. I haven't played long enough to get good at the controls. The fumbling around is part of the fun really.

## Installation

This was originally built to be run with docker-compose to keep it simple, but I found that with Apple Silicon, docker was really slow so I ended up going back to rbenv and local Ruby.

Getting this set up again after a couple years I roughly got it going like this:
```
rbenv install 3.3.0
bundle
brew install postgresql
bin/setup
```

## Starting the server locally

`docker-compose up`

## Getting into a console

`docker compose exec playful_ruby bash`
`bin/rails c`

## Reloading the game board

From a console:

`GameTile.delete_all`
`GameTile.generate(rows: 10, columns:10)`

## Aspirations for this Game

I have a ton of aspirations for this game. The best part is that just by firing it up and tinkering with it, I start to have a lot of ideas of what I want to do next. This is what I want to share with people. There is so much value in just having fun and playing around with code.

Here are some things I'd like to have fun implementing:

- [ ] Better terrain. Right now there's just one ugly tile for rocks. I'd like to have paths, trees, gravel, bushes etc.
  - [ ] Add the terraform command so that you can edit the environment.
- [ ] A race mode where you just have to run around a track. It's hard to move around so this would be a fun tutorial mode.
  - [ ] Add bots that you can race against.
  - [ ] Add animals and npcs
- [ ] Add some simple combat, maybe you can hold a shield, hold out a spear and run into things, or swipe at nearby squares with a sword, etc.
- [ ] Add magic. This would open an editor where you could write code and directly manipulate the world through commands. This could lead to potentially hillarous results. If your avatar is frozen writing out a spell and someone rushes you with a sword, then that's not a great strategy, but maybe you're just that fast and it's worth it?
  - [ ] Maybe magic is something you can save between matches?
- [ ] Implement a simple story based RPG
- [ ] Add map tiles that allow you to move between maps. Maybe there are houses on the map and entering a house sends you to the house map?
- [ ] Integrate with AI tools to generate terrain, character avatars, animations etc.
- [ ] Allow people to design their characters and animations.

