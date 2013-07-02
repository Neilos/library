require 'sinatra/base'
require 'googlebooks'
require_relative '../models/dmconfig'

class MainController < Sinatra::Base

  configure do
    set :root, Proc.new { File.join(File.dirname(__FILE__), "../../") }
  end



  get '/' do
    erb :home
  end

  get '/search_for_book' do 
    erb :search_for_book
  end  

  get '/display_results' do
    @count = params[:count] || "10"
    @search = params[:search]
    @books = GoogleBooks.search(params[:search], {:count => @count.to_i})
    erb :results
  end


end


