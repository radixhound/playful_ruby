class GameTile < ApplicationRecord
  belongs_to :game_piece, optional: true

  scope :all_by_grid, -> { all.order(row: :asc, column: :asc) }
  # scope :by_coordinates, ->(coordinates) { find_by(coordinates.to_h) }

  def self.generate(rows:, columns:)
    rows.times do |row_number|
      columns.times { |column_number| GameTile.create!(row: row_number, column: column_number) }
    end
  end

  def empty?
    game_piece.blank?
  end

  # defines if this row should be shifted to the right so the the hexes line up
  def first_offset?
    row % 2 == 1 && column == 0
  end

  def first_of_row?
    column == 0
  end

  def clear!
    update(game_piece_id: nil)
  end

  def coordinates
    Coordinates.new(row: row, column: column)
  end

  class Coordinates
    attr_reader :row, :column

    def initialize(row:, column:)
      @row = row
      @column = column
    end

    def move(movement:, direction:)
      case movement
      when 'left'
        new_column = column.zero? ? 0 : column - 1
        Coordinates.new(row: row, column: new_column)
      when 'right'
        new_column = (column == 5) ? 5 : column + 1
        Coordinates.new(row: row, column: new_column)
      else
        self
      end
    end

    def to_h
      { row: row, column: column }
    end
  end
end
