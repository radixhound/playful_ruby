# == Schema Information
#
# Table name: game_tiles
#
#  id            :bigint           not null, primary key
#  background    :string
#  column        :integer
#  row           :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  game_board_id :bigint
#  game_piece_id :bigint
#
# Indexes
#
#  index_game_tiles_on_game_board_id  (game_board_id)
#  index_game_tiles_on_game_piece_id  (game_piece_id)
#
require "test_helper"

class GameTileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
