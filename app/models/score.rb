# == Schema Information
#
# Table name: scores
#
#  id            :bigint           not null, primary key
#  label         :string
#  name          :string
#  value         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  game_board_id :bigint           not null
#  player_id     :bigint           not null
#
# Indexes
#
#  index_scores_on_game_board_id  (game_board_id)
#  index_scores_on_player_id      (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (game_board_id => game_boards.id)
#  fk_rails_...  (player_id => players.id)
#
class Score < ApplicationRecord
  belongs_to :player
  belongs_to :game_board

  broadcasts_to :game_board
end
