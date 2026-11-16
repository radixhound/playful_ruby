class HexCoordinates < Coordinates
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

    return new_coordinates unless protected

    new_coordinates.off_board? ? self : new_coordinates
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
end
