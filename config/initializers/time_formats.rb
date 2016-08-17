Date::DATE_FORMATS[:default] = "%e %b %Y"
Time::DATE_FORMATS[:default] = "%H:%M"
DEFAULT_DATETIME_FORMAT = "%e %b %Y %H:%M"
class DateTime 
  def to_s 
    strftime DEFAULT_DATETIME_FORMAT
  end
end