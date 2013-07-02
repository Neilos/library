require 'sinatra/base'
require 'googlebooks'
require_relative '../models/dmconfig'

class Main < Sinatra::Base

  configure do
    set :root, Proc.new { File.join(File.dirname(__FILE__), "../../") }
  end



  get '/' do
    erb :home
  end

  get '/display_results' do
    @count = params[:count] || "10"
    @search = params[:search]
    @books = GoogleBooks.search(params[:search], {:count => @count.to_i})
    erb :results
  end


end

