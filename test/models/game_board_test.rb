# == Schema Information
#
# Table name: game_boards
#
#  id         :bigint           not null, primary key
#  board_type :text             default("hex"), not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class GameBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
