class AddCostToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :cost, index: true
    add_foreign_key :events, :costs
  end
end
