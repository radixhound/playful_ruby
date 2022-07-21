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

    def face(command:)
      command == 'face_right' ? face_right! : face_left!
    end

    def face_right!
      update(direction: 'right')
    end

    def face_left!
      update(direction: 'left')
    end
  end
end
