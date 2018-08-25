class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :name
      t.string :link
      t.text :category

      t.timestamps null: false
    end
  end
end
