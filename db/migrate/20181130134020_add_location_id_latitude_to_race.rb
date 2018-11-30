class AddLocationIdLatitudeToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :location_id_latitude, :float
  end
end
