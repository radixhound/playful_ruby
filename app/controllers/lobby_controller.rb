class LobbyController < ApplicationController
  # Move the person
  #
  # DONE render buttons to the page
  # DONE send command to the server to move the person
  #   - Player.update position player_controller CRUD
  #   - Player.update(direction: "up")
  #   - PlayerMovementIntentController#POST
  #   -
  # DONE store of the state of the person
  # send updates back to the screen to update the game board
  #
  def index
    @game_tiles = GameTile.all_by_grid
    @player = GamePieces::Player.last # this should be tied to the current login
  end
end
