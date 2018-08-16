class AddImageToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :image, :string
  end
end
