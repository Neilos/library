require 'rspec'
require_relative '../../lib/models/user'

describe User do

  it "should be possible to set a password and retrieve a hashed version of the password" do
    @user = User.new
    set_password = "password"
    @user.password = set_password
    retrieved_password = @user.password
    expect(set_password).to_not equal retrieved_password
  end

end 