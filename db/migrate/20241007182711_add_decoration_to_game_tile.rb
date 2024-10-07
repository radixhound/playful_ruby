class AddDecorationToGameTile < ActiveRecord::Migration[7.0]
  def change
    add_column :game_tiles, :decoration, :jsonb, default: {}, null: false
  end
end
