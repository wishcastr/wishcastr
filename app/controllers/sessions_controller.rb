class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    render :text => auth_hash.inspect
    # redirect_to '/'
  end

  def failure
  end

  def destroy
    session[:user_id] = nil
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
