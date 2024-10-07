# == Schema Information
#
# Table name: board_imports
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :string           default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BoardImportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
