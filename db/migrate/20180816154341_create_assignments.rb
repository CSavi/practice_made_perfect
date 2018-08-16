class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :title
      t.integer :lesson_hours
      t.integer :lesson_planning_hours
      t.datetime :created, null: false 
      t.datetime :updated, null: false
      t.integer :instructor_id
    end
  end
end
