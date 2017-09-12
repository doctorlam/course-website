class Contentmodule < ActiveRecord::Base
  belongs_to :slides

   has_attached_file :modularimage, :styles => { :medium => "150x150>", :thumb => "30x30" }
  validates_attachment_content_type :modularimage, :content_type => /\Aimage\/.*\Z/
end
