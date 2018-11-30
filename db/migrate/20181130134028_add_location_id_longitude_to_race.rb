class AddLocationIdLongitudeToRace < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :location_id_longitude, :float
  end
end
