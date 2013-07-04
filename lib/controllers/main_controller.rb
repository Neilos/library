require 'sinatra/base'
require 'googlebooks'
require_relative '../models/dmconfig'

class MainController < Sinatra::Base

  configure do
    use Rack::Session::Cookie, :key => 'rack.session',
                               :secret => 'hello my name is simon'

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
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    else
      erb :signup
    end
  end

  get '/login' do
    # @user = User.new
    erb :login
  end

  post '/login' do
    @user = User.first(:email => params[:email])
    if @user &&  @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/user/#{@user.id}"
    else
      # @user.errors.add(:email, "email or password invalid")
      erb :login
    end
  end

  get '/user/:id' do |id|
    @user = User.get(id)
    erb :user_profile
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


