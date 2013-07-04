require 'dm-validations'
require 'data_mapper'

class Book
  include DataMapper::Resource
  belongs_to :collection

  property :id,     Serial
  property :title, String
  property :author, String
  property :isbn, String
  property :categories, String
  property :text_snippet, Text

  # validates_with_method :title, :method => :no_swear_words
  validates_with_method :no_swear_words

  def no_swear_words
    debugger
    result = title =~ /fuck/i
    result.nil?
  end

end








