class HexCoordinates
  MAX_COLUMN = 9
  MAX_ROW = 7

  attr_reader :row, :column

  def initialize(row:, column:)
    Rails.logger.info "New Coordinate: #{row}, #{column}"
    @row = row
    @column = column
  end

  def move(movement:, facing:, protected: true)
    new_coordinates = case movement
      when 'up' then move_up(facing)
      when 'down' then move_down(facing)
      when 'left'
        new_column = column - 1
        HexCoordinates.new(row: row, column: new_column)
      when 'right'
        new_column = column + 1
        HexCoordinates.new(row: row, column: new_column)
      else
        self
      end

    if protected
      new_coordinates.off_board? ? self : new_coordinates
    else
      new_coordinates
    end
  end

  def to_h
    { row: row, column: column }
  end

  def top?
    row == 0
  end

  def bottom?
    puts "BOTTOM: #{row} ? #{row == MAX_ROW}"

    row >= MAX_ROW
  end

  def leftmost?
    column == 0
  end

  def rightmost?
    puts "RIGHTMOST: #{column} ? #{column == MAX_COLUMN}"
    # this is a bit of a problem because the max is not dynamic
    # we need to store the size of the board on the board itself
    # rather than relying on constants
    column >= MAX_COLUMN
  end

  def move_up(facing)
    new_row = row - 1

    new_column = if facing == 'right'
      row_offset? ? column + 1 : column
    else
      row_offset? ? column : column - 1
    end

    HexCoordinates.new(row: new_row, column: new_column)
  end

  def move_down(facing)
    new_row = row + 1

    new_column = if facing == 'right'
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
