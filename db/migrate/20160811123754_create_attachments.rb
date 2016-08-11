class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
