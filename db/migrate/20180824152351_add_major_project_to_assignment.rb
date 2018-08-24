class AddMajorProjectToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :major_project, :binary
  end
end
