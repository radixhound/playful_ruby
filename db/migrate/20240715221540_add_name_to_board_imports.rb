class AddNameToBoardImports < ActiveRecord::Migration[7.0]
  def change
    add_column :board_imports, :name, :string
    add_column :game_boards, :name, :string
  end
end
