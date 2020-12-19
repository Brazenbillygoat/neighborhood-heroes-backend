class Competitions < ActiveRecord::Migration[6.0]
  def change
    create_table :competitions do |t|
      t.belongs_to :user
      t.belongs_to :tournament

      t.timestamps
    end
  end
end
