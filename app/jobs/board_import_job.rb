class BoardImportJob < ApplicationJob
  queue_as :default
  COMMANDS = %w[NAME TILES BOARD].freeze

  def perform(board_import_id)
    @board_import = BoardImport.find(board_import_id)
    GameBoard.destroy_all # for now :sad
    GameTile.destroy_all # for now :sad
    @board = GameBoard.create(board_type: 'square')
    @tiles_mapping = {}
    @row = 0

    current_section = nil
    @board_import.file.download.each_line do |line|
      statement = line.strip

      if statement.in?(COMMANDS)
        current_section = case statement
        when 'NAME' then :name
        when 'TILES' then :tiles
        when 'BOARD' then :board
        end
        next
      end

      @board_import.update(status: "processing: #{current_section}")

      case current_section
      when :name then process_name(statement)
      when :tiles then process_tiles(statement)
      when :board then process_board(statement)
      end

      @board_import.update(status: "complete")
    end
  end

  private

  def process_name(name)
    @board_import.update(name:)
    @board.update(name:)
  end

  def process_tiles(statement)
    key, terrain = statement.split('=')
    @tiles_mapping[key] = terrain
  end

  def process_board(statement)
    statement.each_char.with_index do |char, index|
      tile_name = @tiles_mapping[char]

      GameTile.create(
        game_board: @board,
        row: @row,
        column: index,
        rotation: rand(0..5),
        background: tile_name,
      )
    end
    @row += 1
  end
end
