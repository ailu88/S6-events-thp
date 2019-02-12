class UsersController < ApplicationController

    def index
    	@users = Event.all
    end

  def show
        @user = User.find(params[:id])
        @events = Event.where("admin_id = ?", params[:id])
  end

  def new
    	@user = User.new
  end

  def edit
    	@user = User.find(params[:id])
  end

    def create
    
    end

  def update
  end

  def destroy
	    @user = User.find(params[:id])
	    @user.destroy
	    redirect_to users_path
  end

end
