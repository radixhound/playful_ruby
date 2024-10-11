# == Schema Information
#
# Table name: game_tiles
#
#  id            :bigint           not null, primary key
#  background    :string
#  column        :integer
#  decoration    :jsonb            not null
#  rotation      :integer          default(0)
#  row           :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  game_board_id :bigint
#  game_piece_id :bigint
#
# Indexes
#
#  index_game_tiles_on_game_board_id  (game_board_id)
#  index_game_tiles_on_game_piece_id  (game_piece_id)
#
class GameTile < ApplicationRecord
  include ActionView::RecordIdentifier # This makes dom_id available in the model

  # need to be able to dynamically set the bounds?
  MAX_COLUMN = 9
  MAX_ROW = 9

  belongs_to :game_board
  belongs_to :game_piece, optional: true

  # Override broadcasting to include `board_type`
  after_create_commit -> { broadcast_custom_game_tile }
  after_update_commit -> { broadcast_custom_game_tile }
  after_destroy_commit -> { broadcast_remove_to game_board }

  validates :column, uniqueness: { scope: :row }

  scope :all_by_grid, -> { all.order(row: :asc, column: :asc) }

  def self.generate(rows:, columns:)
    board = GameBoard.last
    rows.times do |row_number|
      # if a row or column exists, it will just be false
      columns.times do |column_number|
        tile = GameTile.create(
          row: row_number,
          column: column_number,
          rotation: rand(0..5),
          game_board: board,
          background: ['rocks', 'grass', 'grass', 'dirt', 'water'].sample,
        )
        Rails.logger.info "Tile: #{tile.errors.full_messages}" unless tile.valid?
      end
    end
  end

  def navigable_by?(method)
    if background == 'water'
      method == 'boat'
    elsif background == 'nothing'
      method == 'nothing'
    else
      method == 'foot'
    end
  end

  def empty?
    game_piece.blank?
  end

  delegate :first_offset?, to: :coordinates

  def first_of_row?
    column == 0
  end

  def first_row?
    row == 0
  end

  def clear!
    update(game_piece_id: nil)
  end

  def coordinates
    @coordinates ||= case game_board.board_type
    when 'hex' then HexCoordinates.new(row: row, column: column)
    when 'square' then SquareCoordinates.new(row: row, column: column)
    end
  end

  private

  def broadcast_custom_game_tile
    broadcast_replace_to(
      game_board,
      target: dom_id(self),
      partial: "game_tiles/game_tile",
      locals: { game_tile: self, board_type: game_board.board_type }
    )
  end
end
