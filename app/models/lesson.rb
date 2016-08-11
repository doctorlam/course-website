class Lesson < ActiveRecord::Base
	has_many :objectives, :dependent => :destroy
	has_many :readings, :dependent => :destroy
	has_many :homeworks, :dependent => :destroy
	has_many :classactivitys, :dependent => :destroy

	 has_attached_file :image, styles: { medium: "300x>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	accepts_nested_attributes_for :objectives, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :readings, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :homeworks, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :classactivitys, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
