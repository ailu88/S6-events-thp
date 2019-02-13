class AttendancesController < ApplicationController


  def new
      
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
    @user = current_user

  end

  def create
    @attendance = Attendance.new(title: params[:title], description: params[:description], location: params[:location],)
    @attendance.admin = current_user

    if @attendance.save
      flash[:success] = "attendance created !"
      redirect_to @attendance
    else
      render :new
    end
  end

  def destroy
	    @attendance = Attendance.find(params[:id])
	    @attendance.destroy
	    redirect_to attendances_path
  end

end
