module GamePieces
  # maybe this is an avatar?
  class Player < GamePiece
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
      game_tile.touch
    end

    def face_left!
      update(direction: 'left')
      game_tile.touch
    end

    def navigating_by
      "foot"
    end
  end
end
