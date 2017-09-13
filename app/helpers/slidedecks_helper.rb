module SlidedecksHelper
	def show_slide_bg
    	  "background: url(#{@slide.bgimage}) no-repeat center center;
    	  background-size: cover;
    	  background-color: #{@slide.bgcolor}; 
    	  color: #{@slide.color_scheme};
    	  "
  	end
end
