class AddSortToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :sort, :integer
  end
end
