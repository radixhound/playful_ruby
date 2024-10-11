class AddBoardTypeToGameBoard < ActiveRecord::Migration[7.0]
  def change
    add_column :game_boards, :board_type, :text, default: 'hex', null: false
  end
end
