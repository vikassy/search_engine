require 'mechanize'
require 'sinatra'

set :server, 'webrick'

get '/' do
 erb :form
end



def app
  Sinatra::Application
end
