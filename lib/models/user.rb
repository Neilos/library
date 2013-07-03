require 'data_mapper'
require 'bcrypt'
require 'dm-rails'

class User
  include BCrypt
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity
  has 1, :collection

  attr_accessible :first_name, :last_name, :email  
  
  property :id, Serial
  property :first_name, String, required: true 
  property :last_name, String, required: true 
  property :email, String, required: true 
  property :password_hash, Text, required: true, :length => 60

  validates_confirmation_of :password

  def password
    @hashed_password ||= Password.new(password_hash)
  end

  def password=(unhashed_password)
    @hashed_password = Password.create(unhashed_password)
    self.password_hash = @hashed_password
  end

  def password_confirmation
    @password_confirmation
  end

  def password_confirmation=(unhashed_password_confirmation)
    @password_confirmation = unhashed_password_confirmation
  end
end