class RenameColumnTypeinTableInstructorstoCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :instructors, :type, :category
  end
end
