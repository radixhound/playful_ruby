# == Schema Information
#
# Table name: game_boards
#
#  id         :bigint           not null, primary key
#  board_type :text             default("hex"), not null
#  columns    :integer
#  name       :string
#  rows       :integer
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

    rows = 10
    columns = 10
    board = GameBoard.create(name: 'Default Board', rows:, columns:)
    GameTile.generate(rows:, columns:)
  end
end
