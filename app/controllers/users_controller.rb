# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    render locals: {
      facade: DashboardFacade.new
    }
  end

  def new
    @new = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
