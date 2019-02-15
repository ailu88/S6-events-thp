class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    before_action :check_if_admin
     def index
         @events = Event.all
         
     end
 
   def show
         @event = Event.find(params[:id])
   end
 
   def new
       @event = Event.new
       @user = current_user
   end
 
   def edit
         @event = Event.find(params[:id])
   end
 
   def create
     @event = Event.new(title: params[:title], description: params[:description], location: params[:location], duration: params[:duration], price: params[:price], start_date: params[:start_date])
     @event.admin = current_user
 
     if @event.save
       flash[:success] = "Event created !"
       redirect_to @event
     else
       render :new
   end
 
   end
 
   def update
   end
 
   def destroy
         @event = Event.find(params[:id])
         @event.destroy
         redirect_to events_path
   end
 
 end
 