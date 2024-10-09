# == Schema Information
#
# Table name: game_pieces
#
#  id             :bigint           not null, primary key
#  direction      :string
#  lock_version   :integer
#  representation :string
#  type           :string
#  wand           :text             default("nothing"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  player_id      :bigint
#
# Indexes
#
#  index_game_pieces_on_player_id  (player_id)
#
module GamePieces
  # maybe this is an avatar?
  class Player < GamePiece
    # validates :representation, inclusion: { in: GamePieces::Player::APPEARANCES, message: "Please select one of #{GamePieces::Player::APPEARANCES.join(", ")}"}

    APPEARANCES = [
      'Angel', 'Alien', 'Basic_guy', 'Borg', 'Bricky', 'Camouflage', 'Candy', 'Chef', 'Dandy', 'Ninja', 'Squared',
    ].freeze

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

    def representation_image
      if use_asset?
        "nicubunu_Game_baddie_#{representation}.svg"
      else
        "nicubunu_Game_baddie_Ninja.svg"
      end
    end

    def use_asset?
      representation&.length.to_i < 100 && representation.in?(APPEARANCES)
    end
  end
end
