class AddDimsToBoard < ActiveRecord::Migration[7.0]
  def change
    add_column :game_boards, :rows, :integer
    add_column :game_boards, :columns, :integer
  end
end
