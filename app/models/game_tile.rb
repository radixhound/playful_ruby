class GameTile < ApplicationRecord
  # need to be able to dynamically set the bounds?
  MAX_COLUMN = 25
  MAX_ROW = 49

  belongs_to :game_board
  belongs_to :game_piece, optional: true
  broadcasts_to :game_board

  validates :column, uniqueness: { scope: :row }

  scope :all_by_grid, -> { all.order(row: :asc, column: :asc) }

  def self.generate(rows:, columns:)
    board = GameBoard.last
    rows.times do |row_number|
      # if a row or column exists, it will just be false
      columns.times do |column_number|
        tile = GameTile.create(row: row_number, column: column_number, game_board: board)
        Rails.logger.info "Tile: #{tile.errors.full_messages}" unless tile.valid?
      end
    end
  end

  def navigable_by?(method)
    if background == 'water'
      method == 'boat'
    else
      method == 'foot'
    end
  end

  def empty?
    game_piece.blank?
  end

  delegate :first_offset?, to: :coordinates

  def first_of_row?
    column == 0
  end

  def first_row?
    row == 0
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
      Rails.logger.info "New Coordinate: #{row}, #{column}"
      @row = row
      @column = column
    end

    def move(movement:, direction:)
      new_coordinates = case movement
        when 'up' then move_up(direction)
        when 'down' then move_down(direction)
        when 'left'
          new_column = column - 1
          Coordinates.new(row: row, column: new_column)
        when 'right'
          new_column = column + 1
          Coordinates.new(row: row, column: new_column)
        else
          self
        end
      new_coordinates.off_board? ? self : new_coordinates
    end

    def to_h
      { row: row, column: column }
    end

    def move_up(direction)
      new_row = row - 1

      new_column = if direction == 'right'
        row_offset? ? column + 1 : column
      else
        row_offset? ? column : column - 1
      end

      Coordinates.new(row: new_row, column: new_column)
    end

    def move_down(direction)
      new_row = row + 1

      new_column = if direction == 'right'
        row_offset? ? column + 1 : column
      else
        row_offset? ? column : column - 1
      end

      Coordinates.new(row: new_row, column: new_column)
    end

    def row_offset?
      row % 2 == 1
    end

    def first_offset?
      row_offset? && column == 0
    end

    def off_board?
      off = row.negative? || row > MAX_ROW || column.negative? || column > MAX_COLUMN
      Rails.logger.info "Moving OFF BOARD" if off
      off
    end
  end
end
