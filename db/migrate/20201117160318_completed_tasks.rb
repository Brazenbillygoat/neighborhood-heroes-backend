class CompletedTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_tasks do |t|
      t.belongs_to :task
      t.belongs_to :user

      t.timestamps
    end
  end
end
