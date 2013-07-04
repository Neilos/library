
require 'data_mapper'

class Collection

  include DataMapper::Resource

  has n, :book_copies
  belongs_to :user

  property :id, Serial

end