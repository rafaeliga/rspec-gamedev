class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.string :status
      t.references :level

      t.timestamps
    end
    add_index :items, :level_id
  end
end
