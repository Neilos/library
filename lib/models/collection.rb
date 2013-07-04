class Collection

  include DataMapper::Resource

  has n, :books

  property :id, Serial

end