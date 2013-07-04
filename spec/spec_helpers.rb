require_relative '../lib/models/dmconfig'

module SpecHelpers

  def sign_in_user(first_name, last_name, email, password, password_confirmation)
      @user = User.new
      @user.first_name = first_name
      @user.last_name = last_name
      @user.email = email
      @user.password = password
      @user.password_confirmation = password_confirmation
      @user.save
  end

end