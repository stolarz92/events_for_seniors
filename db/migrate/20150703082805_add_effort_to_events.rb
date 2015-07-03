class AddEffortToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :effort, index: true
    add_foreign_key :events, :efforts
  end
end
