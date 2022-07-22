class AddRepresentationToGamePiece < ActiveRecord::Migration[7.0]
  def change
    add_column :game_pieces, :representation, :string
  end
end
