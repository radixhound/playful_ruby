class GamePiece < ApplicationRecord
  has_one :game_tile
  broadcasts_to :game_tile

  def place(row:, column:)
    game_tile.update(game_piece_id: nil)
    GameTile.find_by(row: row, column: column).update(game_piece: self)
  end
end
