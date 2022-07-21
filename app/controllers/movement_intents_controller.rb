class MovementIntentsController < ApplicationController
  def create
    movement = params[:movement]
    player = GamePieces::Player.find(params[:player_id])

    if movement.match(/face/)
      player.face(command: movement)
    else
      new_coordinates = player.game_tile.coordinates.move(
        movement: movement, direction: player.direction
      )
      player.place(**new_coordinates.to_h)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root }
    end
  end
end
