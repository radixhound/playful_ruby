class SquareCoordinates
  MAX_COLUMN = 9
  MAX_ROW = 9
  attr_reader :row, :column

  def initialize(row:, column:)
    Rails.logger.info "New Coordinate: #{row}, #{column}"
    @row = row
    @column = column
  end

  def move(movement:, direction:)
    new_coordinates = case movement
      when 'up' then SquareCoordinates.new(row: row - 1, column:)
      when 'down' then SquareCoordinates.new(row: row + 1, column:)
      when 'left' then SquareCoordinates.new(row:, column: column - 1)
      when 'right' then SquareCoordinates.new(row: row, column: column + 1)
      else
        self
      end
    new_coordinates.off_board? ? self : new_coordinates
  end

  def to_h
    { row: row, column: column }
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
