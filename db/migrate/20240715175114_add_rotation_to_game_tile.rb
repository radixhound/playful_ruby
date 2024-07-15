class AddRotationToGameTile < ActiveRecord::Migration[7.0]
  def change
    add_column :game_tiles, :rotation, :integer, default: 0
  end
end
