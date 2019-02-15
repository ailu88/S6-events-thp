class AttendancesController < ApplicationController
    before_action :check_if_admin
    def index
      @event = Event.find(params[:event_id])
      event_id = @event.id
  
      @attendances = Attendance.all 
      @attendances_event = @attendances.where("event_id = ?", event_id)
  
      @users = User.all
    end
  
    def new
    end
  
    def create
          @attendance = Attendance.find(params[:id])
          # @user = User.find(@attendance.attendant_id)
          # @event = Event.find(@attendance.event_id)
    end
  
    def destroy
    end
  
  end
  