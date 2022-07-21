class LobbyController < ApplicationController
  # Move the person
  #
  # render buttons to the page
  # send command to the server to move the person
  #   - Player.update position player_controller CRUD
  #   - Player.update(direction: "up")
  #   - PlayerMovementIntentController#POST
  #   -
  # store of the state of the person
  # send updates back to the screen to update the game board
  #
  def index
    @game_tiles = []
    7.times do |row_number|
      board_row = []
      6.times do |column_number|
        board_row << GameTile.new(row: row_number, column: column_number)
      end
      @game_tiles << board_row
    end
    @game_tiles[4][4].add(GamePiecePerson.new(direction: :left))
  end

  class GameTile
    attr_reader :row, :column, :content

    def initialize(row:, column:, content: Empty.new)
      @row = row
      @column = column
      @content = content
    end

    def to_key
      [row, column]
    end

    def model_name
      ActiveModel::Name.new(self.class)
    end

    def first_offset?
      row % 2 == 1 && column == 0
    end

    def to_partial_path
      "game_tile"
    end

    def add(piece)
      @content = piece
    end

    def empty?
      @content.blank?
    end
  end

  class GamePiecePerson
    attr_reader :direction

    def initialize(direction: :right)
      @direction = direction
    end

    def to_partial_path
      "person"
    end

    def to_key
      ["#{rand(100)}"]
    end

    def model_name
      ActiveModel::Name.new(self.class)
    end

    def representation
      if direction == :right
        "🤾‍♂️"
      else
        "⛹️‍♂️"
      end
    end
  end

  class Empty
    def blank?
      true
    end
  end
end
