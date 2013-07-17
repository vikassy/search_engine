require 'active_record'
require 'protected_attributes'
#Include all database tables classes
require_relative "../dbconnect"
class Filter < ActiveRecord::Base

  attr_accessible :word



end
