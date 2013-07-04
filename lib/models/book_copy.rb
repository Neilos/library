require 'dm-validations'
require 'data_mapper'

class BookCopy
  include DataMapper::Resource

  belongs_to :book
  belongs_to :collection

  property :id, Serial
end