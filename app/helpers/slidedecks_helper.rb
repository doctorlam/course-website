module SlidedecksHelper
	def show_slide_bg
    	  "background-color: #{@slide.bgcolor}; 
    	  color: #{@slide.color_scheme};"
  	end
end
