require 'sinatra/base'
require 'amazon/ecs'

class Main < Sinatra::Base

  configure do
    set :root, Proc.new { File.join(File.dirname(__FILE__), "../../") }
  end

 Amazon::Ecs.configure do |options|
    options[:response_group] = 'Large'
    options[:AWS_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
    options[:AWS_secret_key] = ENV['AWS_SECRET_KEY']
    options[:associate_tag] = ENV['ASSOCIATE_TAG']
  end


  get '/' do
    erb :home
  end

  get '/display_results' do
    erb :list
  end


end

