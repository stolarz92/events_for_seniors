class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :relationships, :event_id
    add_index :relationships, :user_id
    add_index :relationships, [:event_id, :user_id], unique: true
  end
end
