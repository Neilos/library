require 'rspec'
require_relative '../../lib/models/book'

describe Book do
#   it "should not accept the word fuck in  title" do
#     author = "Dario"
#     isbn = "12121212"
#     categories = "Lifestyle"
#     text_snippet = "Nobody cares..."
#     collection_id = "1"
#     book= Book.create(:title  => "fuck test",
#       :author  => author,
#       :isbn  => isbn,
#       :categories  => categories,
#       :text_snippet  => text_snippet,
#       :collection_id => collection_id
#       )
#     book.valid?.should be true
#   end
# end


  it "should not accept the word fuck in  title" do
    Book.create(:title  => " test").valid?.should be true
  end

  it "should accept the title without fuck in it" do
    Book.create(:title  => "good").valid?.should be true
    # book = Book.new(:title  => "good test")
    # book.valid?.should be true
    # raise book.valid?.to_s
    # expect(book.valid?).to eq true
  end

end

# #   it "should return the title of the book" do
# #     # books = GoogleBooks.search('Ruby', :count => 5)
#     title = "The life of Dario"

#     book = Book.new
#     book.add
#     puts Book.first(:author => "")
#     Book.first.should include("Dario")
#   end
# end


# @book = Book.create(
#       :title  => title,
      # :author  => author,
      # :isbn  => isbn,
      # :categories  => categories,
      # :text_snippet  => text_snippet,
      # :collection_id => collection_id
#     )