class GameTile < ApplicationRecord
  belongs_to :game_piece, optional: true

  scope :all_by_grid, -> { all.order(row: :asc, column: :asc) }

  def self.generate(rows:, columns:)
    rows.times do |row_number|
      columns.times { |column_number| GameTile.create!(row: row_number, column: column_number) }
    end
  end

  def empty?
    game_piece.blank?
  end

  # defines if this row should be shifted to the right so the the hexes line up
  def first_offset?
    row % 2 == 1 && column == 0
  end

  def first_of_row?
    column == 0
  end
end
