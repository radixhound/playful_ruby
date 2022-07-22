class AddBackgroundToGameTile < ActiveRecord::Migration[7.0]
  def change
    add_column :game_tiles, :background, :string
  end
end
