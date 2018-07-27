class AddDefaultToUserArchive < ActiveRecord::Migration
    def up
  change_column :users, :archive, :boolean, default: false
end

def down
  change_column :users, :archive, :boolean, default: nil
end
end
