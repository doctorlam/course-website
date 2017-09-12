class AddSlideIdToContentmodule < ActiveRecord::Migration
  def change
    add_column :contentmodules, :slide_id, :integer
  end
end
