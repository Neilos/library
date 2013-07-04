require 'rspec'
require 'debugger'

require_relative '../../lib/models/book'

describe Book do
  author = "Dario"
  isbn = "12121212"
  categories = "Lifestyle"
  text_snippet = "Nobody cares..."
  collection_id = 1

  it "should not accept the word fuck in  title" do
    book1 = Book.new(
      :title  => "fuck",
      :author  => author,
      :isbn  => isbn,
      :categories  => categories,
      :text_snippet  => text_snippet,
      :collection_id => collection_id
      )
    book1.valid?.should be false
  end

  it "should accept the title without fuck in it" do
     
    book2 =Book.new(
      :title  => "good1",
      :author  => author,
      :isbn  => isbn,
      :categories  => categories,
      :text_snippet  => text_snippet,
      :collection_id => collection_id
    )
    book2.valid?.should be true
  end

end
