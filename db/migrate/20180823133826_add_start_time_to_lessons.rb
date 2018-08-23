class AddStartTimeToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :start_time, :datetime
  end
end
