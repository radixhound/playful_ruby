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
class Player < ApplicationRecord
  attr_accessor :player_svg

  belongs_to :login_credential
  has_one :game_piece

  after_update :apply_game_piece

  def name
    "#{first_name} #{last_name}"
  end

  def apply_game_piece
    game_piece.update(representation: player_svg) if player_svg
  end
end
