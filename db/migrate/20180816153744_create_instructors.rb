class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :password_digest
      t.string :type
      t.integer :instructor_id
    end
  end
end
