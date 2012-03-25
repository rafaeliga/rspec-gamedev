class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.references :game_save
      t.integer :current_level_id

      t.timestamps
    end
    add_index :players, :game_save_id
    add_index :players, :current_level_id
  end
end
