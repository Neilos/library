require 'dm-validations'
require 'data_mapper'

class Book
  include DataMapper::Resource
  has n, :book_copies

  property :id,     Serial
  property :title, String
  property :author, String
  property :isbn, String
  property :categories, String
  property :text_snippet, Text

  # validates_with_method :title, :method => :no_swear_words
  validates_with_method :no_swear_words


  def no_swear_words
    result = title =~ /fuck/i
    result.nil?
  end

  def self.exist?(isbn)
    Book.all(:isbn => isbn).count > 0
  end

end








