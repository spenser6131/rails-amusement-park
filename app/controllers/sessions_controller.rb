class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user_password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to "/signin"
    end
  end

  def delete
    @user = User.find_by(id: session[:user_id])
    if @user
      session.delete(:user_id)
    end
    redirect_to root_path
  end

end