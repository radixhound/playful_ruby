class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :value
      t.string :label
      t.string :name
      t.references :game_board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
