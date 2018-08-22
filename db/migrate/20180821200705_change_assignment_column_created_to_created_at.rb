class ChangeAssignmentColumnCreatedToCreatedAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :assignments, :created, :created_at
    rename_column :assignments, :updated, :updated_at
  end
end
