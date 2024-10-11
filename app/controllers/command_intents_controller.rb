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
          target_tile.update(background: @avatar.wand) unless @avatar.wand == "nothing"
        when :split
          split_tiles! # BOOM
        when :insert
          target_tile.update(decoration: { type: :text, content: params[:content] })
        end
      end
    end
  end

  def target_tile
    current_coordinates = @avatar.game_tile.coordinates
    new_coordinates = current_coordinates.move(
      movement: @direction, facing: @avatar.direction
    )
    @target_tile ||= GameTile.find_by(**new_coordinates.to_h)
  end

  def split_tiles!
    @loop_count = 0

    last_tile = nil
    first_of_row = @avatar.game_tile
    facing = @avatar.direction
    puts "\n\n-----\nsplitting #{@direction} #{first_of_row.inspect}"
    case @direction
    when 'up'
      # for each decrementing rows, insert a new tile, slide the rest of the row up by popping the next tile and
      # overwriting it with the current tile
      while !first_of_row.top?
        current_tile = first_of_row = first_of_row.to_the('up', facing:).pick_up!
        facing = facing == 'right' ? 'left' : 'right' # zig zag so we split up
        while !current_tile.rightmost?
          current_tile = current_tile.to_the('right').swap!(current_tile).tap(&safely)
        end
      end
    when 'down'
      while !first_of_row.bottom?
        current_tile = first_of_row = first_of_row.to_the('down', facing:).pick_up!
        facing = facing == 'right' ? 'left' : 'right' # zig zag so we split down
        while !current_tile.rightmost?
          current_tile = current_tile.to_the('right').swap!(current_tile).tap(&safely)
        end
      end
    when 'left'
      while !first_of_row.leftmost?
        current_tile = first_of_row = first_of_row.to_the('left').pick_up!
        while !current_tile.bottom?
          current_tile = current_tile.to_the('down').swap!(current_tile).tap(&safely)
        end
      end
    when 'right'
      while !first_of_row.rightmost?
        current_tile = first_of_row = first_of_row.to_the('right').pick_up!
        while !current_tile.bottom?
          current_tile = current_tile.to_the('down').swap!(current_tile).tap(&safely)
        end
      end
    end
  end

  def safely
    proc do
      @loop_count += 1
      if @loop_count > 100
        raise "Too many iterations"
      end
    end
  end
end
