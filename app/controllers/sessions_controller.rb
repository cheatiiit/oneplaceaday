class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    
    Rails.logger.debug("User id: #{@user.inspect}")
    redirect_to new_user_registration_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
