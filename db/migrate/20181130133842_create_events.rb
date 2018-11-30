class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :distance_id
      t.string :description

      t.timestamps
    end
  end
end
