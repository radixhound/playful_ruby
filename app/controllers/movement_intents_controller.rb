class MovementIntentsController < ApplicationController
  def create
    player = GamePieces::Player.find(params[:player_id])
    new_coordinates = player.game_tile.coordinates.move(
      movement: params[:movement], direction: player.direction
    )
    player.place(**new_coordinates.to_h)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root }
    end
  end
end