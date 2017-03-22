class SessionsController < ApplicationController

def new
    @user = User.new
    redirect_to '/' if logged_in?
  end

  def create
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
