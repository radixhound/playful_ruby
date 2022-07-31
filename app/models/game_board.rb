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
end
