class LobbyController < ApplicationController
  before_action :authenticate_login_credential!

  def index
    @game_board = GameBoard.last
    @game_tiles = @game_board.game_tiles.all_by_grid
    @player = GamePieces::Player.last # this should be tied to the current login
  end
end
