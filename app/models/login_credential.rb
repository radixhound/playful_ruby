# == Schema Information
#
# Table name: login_credentials
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_login_credentials_on_email                 (email) UNIQUE
#  index_login_credentials_on_reset_password_token  (reset_password_token) UNIQUE
#
class LoginCredential < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players
  after_create :create_player

  def create_player
    player = Player.create(first_name: "Player#{id}", last_name: "Welcome", login_credential: self)
    GamePieces::Player.create(player: player).place(row: 0, column: 0)
  end
end
