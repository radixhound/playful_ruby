class GamePiece < ApplicationRecord
  has_one :game_tile

  def place(row:, column:)
    GameTile.where(game_piece: self).update_all(game_piece_id: nil)
    GameTile.find_by(row: row, column: column).update(game_piece: self)
  end
end
