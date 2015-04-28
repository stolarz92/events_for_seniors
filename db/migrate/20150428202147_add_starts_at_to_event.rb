class AddStartsAtToEvent < ActiveRecord::Migration
  def change
    add_column :events, :starts_at, :time
  end
end
