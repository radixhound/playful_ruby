class MovementIntentsController < ApplicationController
  def create
    movement = params[:movement]
    @player = GamePieces::Player.find(params[:player_id])

    ensure_tile_presence # handle if something borked, and put the @player back on the map

    if movement.match(/face/)
      @player.face(command: movement)
    else
      apply_movement(movement)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root }
    end
  end

  def ensure_tile_presence
    while @player.game_tile.blank? || !@player.game_tile.navigable_by?('foot')
      @player.place(row: rand(10..30), column: rand(0..9))
    end
  end

  def apply_movement(movement)
    @player.transaction do
      @player.with_lock do
        @player.touch
        @player.game_tile.reload
        current_coordinates = @player.game_tile.coordinates
        new_coordinates = current_coordinates.move(
          movement: movement, direction: @player.direction
        )
        @player.place(**new_coordinates.to_h) unless new_coordinates == current_coordinates
      end
    end
  end
end
