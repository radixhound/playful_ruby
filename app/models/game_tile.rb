class GameTile < ApplicationRecord
  belongs_to :game_board
  belongs_to :game_piece, optional: true
  broadcasts_to :game_board

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

  delegate :first_offset?, to: :coordinates

  def first_of_row?
    column == 0
  end

  def clear!
    update(game_piece_id: nil)
  end

  def coordinates
    @coordinates ||= Coordinates.new(row: row, column: column)
  end

  class Coordinates
    attr_reader :row, :column

    def initialize(row:, column:)
      @row = row
      @column = column
    end

    def move(movement:, direction:)
      case movement
      when 'up' then move_up
      when 'down' then move_down
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

    def move_up
      new_row = row - 1

      # going right
      new_column = row_offset? ? column + 1 : column

      return self if new_row.negative? || new_column > 5

      Coordinates.new(row: new_row, column: new_column)
    end

    def move_down
      new_row = row + 1

      # going right
      new_column = row_offset? ? column : column - 1

      return self if new_row > 6 || new_column.negative?

      Coordinates.new(row: new_row, column: new_column)
    end

    def row_offset?
      row % 2 == 1
    end

    def first_offset?
      row_offset? && column == 0
    end
  end
end