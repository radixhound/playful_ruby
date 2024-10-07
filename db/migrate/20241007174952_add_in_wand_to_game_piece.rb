class AddInWandToGamePiece < ActiveRecord::Migration[7.0]
  def change
    add_column :game_pieces, :wand, :text, default: "nothing", null: false
  end
end
