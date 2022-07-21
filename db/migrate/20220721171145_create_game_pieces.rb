class CreateGamePieces < ActiveRecord::Migration[7.0]
  def change
    create_table :game_pieces do |t|
      t.string :type
      t.string :direction

      t.timestamps
    end
  end
end
