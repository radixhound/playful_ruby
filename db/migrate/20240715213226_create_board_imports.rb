class CreateBoardImports < ActiveRecord::Migration[7.0]
  def change
    create_table :board_imports do |t|
      t.string :status

      t.timestamps
    end
  end
end
