class GamePiece < ApplicationRecord
  has_one :game_tile
  broadcasts_to :game_tile

  def place(row:, column:)
    game_tile.clear! if game_tile.present?
    GameTile.find_by(row: row, column: column).update(game_piece: self)
  end
end
