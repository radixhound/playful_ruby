# frozen_string_literal: true

class Coordinates
  attr_reader :row, :column

  def initialize(row:, column:, max_row: 20, max_column: 20)
    Rails.logger.info "New Coordinate: #{row}, #{column}"
    @row = row
    @column = column
    @max_row = max_row
    @max_column = max_column
  end

  def to_h
    { row: row, column: column }
  end

  def top?
    row == 0
  end

  def bottom?
    row >= max_row
  end

  def leftmost?
    column == 0
  end

  def rightmost?
    # this is a bit of a problem because the max is not dynamic
    # we need to store the size of the board on the board itself
    # rather than relying on constants
    column >= max_column
  end

  def off_board?
    off = row.negative? || bottom? || column.negative? || rightmost?
    Rails.logger.info "Moving OFF BOARD" if off
    off
  end

  private

  attr_reader :max_row, :max_column
end
