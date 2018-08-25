class Link < ActiveRecord::Base
	include RailsSortable::Model
  			set_sortable :sort
end
