class CreateGameBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :game_boards do |t|
      t.timestamps
    end
  end
end
