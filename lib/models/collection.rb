require 'data_mapper'

class Collection

  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
 
end