class AddArchiveToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :archive, :boolean
  end
end
