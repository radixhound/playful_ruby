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
      @player.place(row: rand(2..9), column: rand(0..9))
    end
  end

  def apply_movement(movement)
    count = params[:n].to_i
    count = 1 if count.zero?

    @player.transaction do
      @player.with_lock do
        @player.touch
        @player.game_tile.reload
        new_coordinates = @player.game_tile.coordinates
        count.times do
          new_coordinates = new_coordinates.move(
            movement: movement, facing: @player.direction
          )
        end
        @player.place(**new_coordinates.to_h) unless new_coordinates == @player.game_tile.coordinates
      end
    end
  end
end
