class Tournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :description
      t.integer :creator_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
