class HexCoordinates
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
      when 'up' then move_up(direction)
      when 'down' then move_down(direction)
      when 'left'
        new_column = column - 1
        HexCoordinates.new(row: row, column: new_column)
      when 'right'
        new_column = column + 1
        HexCoordinates.new(row: row, column: new_column)
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

    HexCoordinates.new(row: new_row, column: new_column)
  end

  def move_down(direction)
    new_row = row + 1

    new_column = if direction == 'right'
      row_offset? ? column + 1 : column
    else
      row_offset? ? column : column - 1
    end

    HexCoordinates.new(row: new_row, column: new_column)
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
