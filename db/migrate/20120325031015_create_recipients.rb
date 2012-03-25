class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.references :farmer
      t.references :level

      t.timestamps
    end
    add_index :recipients, :level_id
  end
end
