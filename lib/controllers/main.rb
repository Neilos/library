require 'sinatra/base'

class Main < Sinatra::Base

configure do
  set :root, Proc.new { File.join(File.dirname(__FILE__), "../../") }
end

get '/' do
  erb :home
end


end

