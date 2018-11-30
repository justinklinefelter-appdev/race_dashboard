class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.integer :event_id
      t.integer :year_id
      t.string :location_id

      t.timestamps
    end
  end
end
