class AddDefaultValueToArchive < ActiveRecord::Migration
  def up
  change_column :submissions, :archive, :boolean, default: false
end

def down
  change_column :submissions, :archive, :boolean, default: nil
end
end
