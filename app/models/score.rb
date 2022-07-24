class Score < ApplicationRecord
  belongs_to :player
  belongs_to :game_board

  broadcasts_to :game_board
end
