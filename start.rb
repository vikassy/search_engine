require 'mechanize'
require 'sinatra'

set :server, 'webrick'

get '/' do
 erb :form
end

post '/form' do
 erb :display
end


def app
  Sinatra::Application
end
