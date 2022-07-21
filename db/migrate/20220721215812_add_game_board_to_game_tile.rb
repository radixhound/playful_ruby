class AddGameBoardToGameTile < ActiveRecord::Migration[7.0]
  def change
    add_reference :game_tiles, :game_board, null: true
  end
end
