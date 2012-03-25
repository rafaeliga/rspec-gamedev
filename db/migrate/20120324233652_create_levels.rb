class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.time :total_time
      t.integer :number_of_items_to_collect
      t.references :farmer
      t.references :recipient

      t.timestamps
    end
  end
end
