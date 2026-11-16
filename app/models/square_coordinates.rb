class SquareCoordinates < Coordinates
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

  def first_offset?
    false
  end

  def off_board?
    off = row.negative? || bottom? || column.negative? || rightmost?
    Rails.logger.info "Moving OFF BOARD" if off
    off
  end
end
