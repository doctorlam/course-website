class Project < ActiveRecord::Base
	belongs_to :course
	has_many :lessons
	has_many :deliverables, :dependent => :destroy
	has_many :criterium, :dependent => :destroy
	has_many :related, :dependent => :destroy
	belongs_to :user

	accepts_nested_attributes_for :deliverables, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :criterium, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :related, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true

end
