require 'data_mapper'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource
 
  has 1, :collection

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :password_hash, String

  def password
    @hashed_password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @hashed_password = Password.create(new_password)
    self.password_hash = @hashed_password
  end


end