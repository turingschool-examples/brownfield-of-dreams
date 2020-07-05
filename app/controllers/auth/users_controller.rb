class Auth::UsersController < ApplicationController
  def edit ; end

  def update
    user = User.find(current_user.id)
    user.update(github_token: auth_hash[:credentials][:token])
    redirect_to dashboard_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
