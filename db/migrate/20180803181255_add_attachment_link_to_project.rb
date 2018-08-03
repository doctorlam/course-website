class AddAttachmentLinkToProject < ActiveRecord::Migration
  def change
    add_column :projects, :attachment_link, :string
  end
end
