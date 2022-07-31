# == Schema Information
#
# Table name: players
#
#  id                  :bigint           not null, primary key
#  first_name          :string
#  last_name           :string
#  score               :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  login_credential_id :bigint           not null
#
# Indexes
#
#  index_players_on_login_credential_id  (login_credential_id)
#
# Foreign Keys
#
#  fk_rails_...  (login_credential_id => login_credentials.id)
#
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
