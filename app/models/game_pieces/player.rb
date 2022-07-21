module GamePieces
  class Player < GamePiece
    def representation
      facing_right? ?  "🤾‍♂️" : "⛹️‍♂️"
    end

    def facing_right?
      direction == 'right'
    end

    def facing_left?
      direction == 'left'
    end
  end
end
