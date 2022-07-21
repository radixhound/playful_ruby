class CreateGameTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :game_tiles do |t|
      t.integer :row
      t.integer :column
      t.references :game_piece, null: true

      t.timestamps
    end
  end
end
