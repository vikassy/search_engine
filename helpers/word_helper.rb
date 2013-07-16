require "sanitize"
require_relative "../dbconnect"
require_relative "../model/filterWord"
def filter (text= "")

  filters = Filter.all

  text = clean(text)
  text = text.strip
  if text.nil?
    text = ""
  end
  text = text.downcase
  text = text.split

  filters.each do |filter|
   text.delete(filter[:word].downcase)
   end

   return text


end

def clean(text = "")

  text = Sanitize.clean(text,:remove_contents => ['script', 'style'])
  return text

end
