class AddLockToGamePiece < ActiveRecord::Migration[7.0]
  def change
    add_column :game_pieces, :lock_version, :integer
  end
end
