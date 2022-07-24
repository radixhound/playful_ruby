class Player < ApplicationRecord
  attr_accessor :player_svg

  belongs_to :login_credential
  has_one :game_piece
  broadcasts_to :game_board

  after_update :apply_svg

  def name
    "#{first_name} #{last_name}"
  end

  def apply_svg
    game_piece.update(representation: player_svg) if player_svg
  end
end
