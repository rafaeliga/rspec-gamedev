class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :type
      t.integer :life, :default => 0
      t.integer :enemy_level_id

      t.timestamps
    end

    add_index "characters", ["enemy_level_id"], :name => "index_characters_on_enemy_level_id"
  end
end
