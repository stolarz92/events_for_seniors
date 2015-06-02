class AddEffortToEvents < ActiveRecord::Migration
  def change
    add_column :events, :effort, :integer
  end
end
