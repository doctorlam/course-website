class AddSortToProject < ActiveRecord::Migration
  def change
    add_column :projects, :sort, :integer
  end
end
