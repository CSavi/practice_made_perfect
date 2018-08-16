class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.text :description 
      t.integer :count
      t.datetime :lesson_datetime
      t.integer :student_id
      t.integer :instructor_id
    end
  end
end
