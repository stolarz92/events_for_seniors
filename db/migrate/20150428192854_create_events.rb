class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.time :starts_at
      t.time :ends_at
      t.string :location

      t.timestamps null: false
    end
  end
end
