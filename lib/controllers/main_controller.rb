require 'sinatra/base'
require 'googlebooks'
require_relative '../models/dmconfig'

class MainController < Sinatra::Base

  configure do
    set :root, Proc.new { File.join(File.dirname(__FILE__), "../../") }
  end

  get '/signup' do 
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      redirect '/'
    else
      erb :signup
    end
  end

  get '/search_for_book' do 
    erb :search_for_book
  end  

  get '/display_results' do
    @count = (params[:count] || "10").to_i
    @page = (params[:page] || "1").to_i
    @search = params[:search]
    @books = GoogleBooks.search(params[:search], {:count => @count, :page => @page})
    erb :results
  end

  get '/' do
    erb :home
  end

end


