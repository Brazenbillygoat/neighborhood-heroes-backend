class Tasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :points
      t.integer :limit
      t.integer :creator_id
      t.belongs_to :tournament
    end
  end
end
