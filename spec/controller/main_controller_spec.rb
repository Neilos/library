require 'rspec'
require 'rack/test'
require_relative '../../lib/controllers/main_controller'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  MainController.new
end

describe MainController do


  describe "GET /" do
    it "renders the results page" do
      get '/'
      last_response.ok?.should be_true
      expect(last_response.body).to include "Bookster Home Page"
    end
  end

  describe "GET/search_for_book" do
    it "renders the search_for_book page" do
      get '/search_for_book'
      last_response.ok?.should be_true
      expect(last_response.body).to include "Search for book"
    end
  end

  describe "GET/display_results" do
    it "renders the results page" do
      get '/display_results?search=count'
      last_response.ok?.should be_true
      expect(last_response.body).to include "Search Results"
    end
  end

  describe "POST/add_to_collection" do
    it "..." do
      pending
    end
  end

  describe "POST/delete_from_collection" do
    it "..." do
      pending
    end
  end

  describe "GET/list_collections" do
    it "renders..." do
      pending
    end
  end

  describe "GET/list_books" do
    it "renders..." do
      pending
    end
  end

  # user controller actions
  describe "GET/new_user" do
    it "renders..." do
      pending
    end
  end

  describe "POST/create_user" do
    it "..." do
      pending
    end
  end

  describe "GET/edit_user" do
    it "renders..." do
      pending
    end
  end

  describe "POST/update_user" do
    it "..." do
      pending
    end
  end

  describe "GET/show_user" do
    it "renders..." do
      pending
    end
  end

  describe "POST/delete_user" do
    it "renders..." do
      pending
    end
  end

  describe "GET/list_users" do
    it "renders..." do
      pending
    end
  end
end