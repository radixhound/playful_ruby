class LobbyController < ApplicationController
  before_action :authenticate_login_credential!

  def index
    @game_board = GameBoard.last
    @game_tiles = @game_board.game_tiles.all_by_grid.where(row: 0..49, column: 0..9)
    @player = current_login_credential.players.first
    @avatar = @player.game_piece
    @high_scores = Score.order(value: :desc).limit(10)
  end
end
