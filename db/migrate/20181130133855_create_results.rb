class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :race_id
      t.string :time
      t.integer :overall_place_id
      t.integer :age_group_place_id
      t.string :body

      t.timestamps
    end
  end
end
