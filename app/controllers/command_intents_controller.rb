# CommandIntentsController
#
# This controller will issue commands like delete, create, terraform (change a game piece type)
#
class CommandIntentsController < ApplicationController
  before_action :find_player

  def create
    @direction = params[:direction]

    ensure_tile_presence # handle if something borked, and put the @avatar back on the map

    apply_command(params[:command])

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to :root }
    end
  end

  private

  def find_player
    @avatar = GamePieces::Player.find(params[:player_id])
  end

  # ensure the tile in the direction we're issueing the command is present
  def ensure_tile_presence
    # what do we want to happen if there is no tile there? We really just want to render the
    # normal command palette
    # maybe we need to flash or beep or something to indicate it did nothing?
  end

  def apply_command(command)
    @avatar.transaction do
      @avatar.with_lock do
        @avatar.touch
        @avatar.game_tile.reload
        case command.to_sym
        when :delete
          target_tile.update(background: :nothing)
        when :create
          puts "\n\n\n Create: #{@avatar.wand} \n\n\n"
          target_tile.update(background: @avatar.wand) unless @avatar.wand == "nothing"
        end
      end
    end
  end

  def target_tile
    current_coordinates = @avatar.game_tile.coordinates
    new_coordinates = current_coordinates.move(
      movement: @direction, direction: @avatar.direction
    )
    @target_tile ||= GameTile.find_by(**new_coordinates.to_h)
  end
end
