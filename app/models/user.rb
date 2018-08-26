class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
 validates :name, presence: true
  has_many :lessons
   has_many :projects 
   has_many :abouts
   has_many :submissions
   has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "30x30" }, :default_url => "missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  attr_accessor :delete_avatar
  before_validation { avatar.clear if delete_avatar == '1' }
     module DeletableAttachment
      extend ActiveSupport::Concern

      included do
        attachment_definitions.keys.each do |name|

          attr_accessor :"delete_#{name}"
          attr_accessible :"delete_#{name}"
          
          before_validation { send(name).clear if send("delete_#{name}") == '1' }

          define_method :"delete_#{name}=" do |value|
            instance_variable_set :"@delete_#{name}", value
            send("#{name}_file_name_will_change!")
          end

        end
      end

    end

  acts_as_commontator
  has_many :posts, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :presentations
  has_many :notes, dependent: :destroy
 

end
