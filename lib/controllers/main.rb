require 'sinatra/base'
require 'googlebooks'

class Main < Sinatra::Base

  configure do
    set :root, Proc.new { File.join(File.dirname(__FILE__), "../../") }
  end



  get '/' do
    erb :home
  end

  get '/display_results' do
    @count = params[:count] || "10"
    @books = GoogleBooks.search(params[:search], {:count => @count.to_i})
    erb :results
  end


end

