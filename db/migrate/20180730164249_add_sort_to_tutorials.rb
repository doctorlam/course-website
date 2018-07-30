class AddSortToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :sort, :integer
  end
end
