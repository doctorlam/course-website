class Lesson < ActiveRecord::Base
	has_many :objectives, :dependent => :destroy
	has_many :readings, :dependent => :destroy
	has_many :homeworks, :dependent => :destroy
	has_many :classactivitys, :dependent => :destroy
	has_many :learnings
	has_many :projects, :through => :learnings
	 has_attached_file :image, styles: { medium: "300x>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	 has_attached_file :anotherdocument

  	 attr_accessor :anotherdocument_file_name
  	 has_attached_file :document


	accepts_nested_attributes_for :objectives, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :readings, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :homeworks, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :classactivitys, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

	belongs_to :user
	belongs_to :course
	acts_as_commontable
	acts_as_votable
  	default_scope { order('date') } 

  	 
end
