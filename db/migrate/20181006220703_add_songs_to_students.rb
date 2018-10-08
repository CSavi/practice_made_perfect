class AddSongsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :song_name, :string
  end
end
