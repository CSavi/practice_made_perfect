class AddUidToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :uid, :string
  end
end
