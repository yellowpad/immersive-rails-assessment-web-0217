class AppearancesController < ApplicationController

  def index
  	@appearances = Appearance.all
  end

  def show
  	@appearance = Appearance.find(params[:id])

  end

  def new
  	@appearance = Appearance.new
  	@guests = Guest.all
  	@episodes = Episode.all  	
  end

  def create   	
  	@appearance = Appearance.new(guest_id: params[:guest_id], episode_id: params[:episode_id], rating: params[:rating])

  	byebug

  	if @appearance.save
  		redirect_to @appearance
  	else 
  		render :new
  	end

  end

  def edit
  	@appearance = Appearance.find(params[:id])
  end

end
