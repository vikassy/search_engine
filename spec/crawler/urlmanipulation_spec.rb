# require 'rspec/given'
require_relative "../../crawler/crawler.rb"

RSpec::Given.use_natural_assertions

describe Crawler do 

  Given(:url_manipulater) {Crawler.new}

  def manipulate(base_url,extracted_url)
    url_manipulater.url_manipulate(base_url,extracted_url)
  end


  Then {manipulate('www.google.com','/hello/world') == "www.google.com/hello/world"}
  Then {manipulate('www.google.com','www.google.com/init/about.html') == "www.google.com/init/about.html"}
  Then {manipulate('www.google.com','support.google.com') == "support.google.com"}
  Then {manipulate('www.google.com','support.google.com/something') == "support.google.com/something"}

end