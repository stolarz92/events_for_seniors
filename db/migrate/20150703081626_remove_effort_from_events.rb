class RemoveEffortFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :effort
  end
end
