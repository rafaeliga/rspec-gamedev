class CreateGameSaves < ActiveRecord::Migration
  def change
    create_table :game_saves do |t|
      t.references :player
      t.references :level

      t.timestamps
    end
    add_index :game_saves, :player_id
    add_index :game_saves, :level_id
  end
end
