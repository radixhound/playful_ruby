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
