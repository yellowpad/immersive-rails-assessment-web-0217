class UsersController < ApplicationController
	
	def new
	    @user = User.new
	end

	def create
	    @user = User.new(user_params(:username, :password))
	    if @user.save
	      session[:user_id] = @user.id
	      redirect_to @user
	    else
	      render :new
	    end
	end

	  def show
	    @user = User.find(params[:id])
	  end


	  def destroy
	    @user.destroy
	    session.destroy
	    redirect_to root_path
	  end
end
