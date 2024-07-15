# == Schema Information
#
# Table name: game_boards
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GameBoard < ApplicationRecord
  has_many :game_tiles

  def self.ensure_board
    GameBoard.last || GameBoard.generate_new
  end

  def self.generate_new
    return if GameBoard.any?

    board = GameBoard.create
    GameTile.generate(rows: 10, columns: 10)
  end
end
