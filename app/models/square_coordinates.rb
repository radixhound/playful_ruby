class SquareCoordinates
  MAX_COLUMN = 20
  MAX_ROW = 20
  attr_reader :row, :column

  def initialize(row:, column:)
    Rails.logger.info "New Coordinate: #{row}, #{column}"
    @row = row
    @column = column
  end

  def move(movement:, facing: 'right', protected: true)
    new_coordinates = case movement
      when 'up' then SquareCoordinates.new(row: row - 1, column:)
      when 'down' then SquareCoordinates.new(row: row + 1, column:)
      when 'left' then SquareCoordinates.new(row:, column: column - 1)
      when 'right' then SquareCoordinates.new(row: row, column: column + 1)
      else
        self
      end

    return new_coordinates unless protected

    new_coordinates.off_board? ? self : new_coordinates
  end

  def to_h
    { row: row, column: column }
  end

  def top?
    row == 0
  end

  def bottom?
    row >= MAX_ROW
  end

  def leftmost?
    column == 0
  end

  def rightmost?
    # this is a bit of a problem because the max is not dynamic
    # we need to store the size of the board on the board itself
    # rather than relying on constants
    column >= MAX_COLUMN
  end

  def first_offset?
    false
  end

  def off_board?
    off = row.negative? || row > MAX_ROW || column.negative? || column > MAX_COLUMN
    Rails.logger.info "Moving OFF BOARD" if off
    off
  end
end
