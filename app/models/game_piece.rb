# == Schema Information
#
# Table name: game_pieces
#
#  id             :bigint           not null, primary key
#  direction      :string
#  lock_version   :integer
#  representation :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  player_id      :bigint
#
# Indexes
#
#  index_game_pieces_on_player_id  (player_id)
#
class GamePiece < ApplicationRecord
  has_one :game_tile
  belongs_to :player

  def place(row:, column:)
    Rails.logger.info "\n\nPlacing player on #{row},#{column}\n\n"
    new_tile = GameTile.find_by(row: row, column: column)

    return if new_tile.blank?
    return unless new_tile.navigable_by?(navigating_by)

    increment_score if new_tile.game_piece_id.present? # If there's someone on the tile then we score

    game_tile.clear! if game_tile.present?
    new_tile.update(game_piece: self)
  end

  def increment_score
    score = Score.find_by(player: player, label: :tag, game_board: GameBoard.last)
    if score.present?
      score.update(value: score.value.to_i + 1, name: player.name)
    else
      Score.create(player: player, label: :tag, game_board: GameBoard.last, value: 1, name: player.name)
    end
  end
end
