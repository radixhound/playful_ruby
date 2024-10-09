class LobbyController < ApplicationController
  before_action :authenticate_login_credential!

  def index
    # hmm I think the turbo streams are going to get crossed
    # if we could have different people on different boards at the same time
    @game_board = params[:board].present? ? GameBoard.find(params[:board]) : GameBoard.last
    @game_tiles = @game_board.game_tiles.all_by_grid.where(row: 0..49, column: 0..9)
    @player = current_login_credential.players.first
    @avatar = @player.game_piece
    @high_scores = Score.order(value: :desc).limit(10)
    @base_size = 180
  end
end
