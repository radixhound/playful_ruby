class AddDefaultStatusToBoardImports < ActiveRecord::Migration[6.0]
  def change
    change_column_default :board_imports, :status, 'pending'
  end
end
