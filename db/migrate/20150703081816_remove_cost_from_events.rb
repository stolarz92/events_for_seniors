class RemoveCostFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :cost
  end
end
