class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :type
      t.string :level
      t.integer :student_id
    end
  end
end
