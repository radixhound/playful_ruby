class GamePiece < ApplicationRecord
  has_one :game_tile
  belongs_to :player
  broadcasts_to :game_tile

  def place(row:, column:)
    Rails.logger.info "\n\nPlacing player on #{row},#{column}\n\n"
    new_tile = GameTile.find_by(row: row, column: column)

    return unless new_tile.navigable_by?(navigating_by)
    game_tile.clear! if game_tile.present?
    new_tile.update(game_piece: self)
  end
end
