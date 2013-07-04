require 'rspec'
require 'debugger'

require_relative '../../lib/models/book'

describe Book do
  author = "Dario"
  isbn = "12121212"
  categories = "Lifestyle"
  text_snippet = "Nobody cares..."

  it "should not accept the word fuck in  title" do
    book1 = Book.new(
      :title  => "fuck",
      :author  => author,
      :isbn  => isbn,
      :categories  => categories,
      :text_snippet  => text_snippet
      )
    book1.valid?.should be false
  end

  it "should accept the title without fuck in it" do
    book2 =Book.new(
      :title  => "good1",
      :author  => author,
      :isbn  => isbn,
      :categories  => categories,
      :text_snippet  => text_snippet
    )
    book2.valid?.should be true
  end

  it "should check if a book exists" do
    book2 =Book.create( :title  => "good1", :author  => author, :isbn  => "12345", :categories  => categories, :text_snippet  => text_snippet )
    debugger
    Book.exist?("12345").should be true
    Book.exist?("55555").should be false
  end

end
