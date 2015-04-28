class AddEndsAtToEvent < ActiveRecord::Migration
  def change
    add_column :events, :ends_at, :time
  end
end
