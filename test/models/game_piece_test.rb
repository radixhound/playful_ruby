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
require "test_helper"

class GamePieceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
