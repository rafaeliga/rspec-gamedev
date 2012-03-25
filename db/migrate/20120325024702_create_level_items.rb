class CreateLevelItems < ActiveRecord::Migration
  def change
    create_table :level_items do |t|
      t.references :itemnable, :polymorphic => true
      t.references :level
      t.references :item

      t.timestamps
    end
    
    add_index :level_items, :level_id
    add_index :level_items, :item_id
    add_index :level_items, :itemnable_id
  end
end
