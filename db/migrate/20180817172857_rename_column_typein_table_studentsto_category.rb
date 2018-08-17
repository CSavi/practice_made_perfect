class RenameColumnTypeinTableStudentstoCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :type, :category
  end
end
