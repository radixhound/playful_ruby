class AddPlayerToGamePiece < ActiveRecord::Migration[7.0]
  def change
    add_reference :game_pieces, :player, null: true
  end
end
