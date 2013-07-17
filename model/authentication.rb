require 'active_record'
require_relative  "../dbconnect.rb"
#Include all database tables classes

class Authentication < ActiveRecord::Base

  attr_accessible :server_name, :server_address, :authentication_token
  
end