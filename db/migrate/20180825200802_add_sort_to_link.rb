class AddSortToLink < ActiveRecord::Migration
  def change
    add_column :links, :sort, :integer
  end
end
