class RemoveCriteriaFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :criteria, :text
  end
end
