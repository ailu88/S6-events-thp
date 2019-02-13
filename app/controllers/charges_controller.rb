class ChargesController < ApplicationController

    def new
        @event = Event.find(params[:event_id])
        @amount = @event.price
    end
    
    def create
      
      @event = Event.find(params[:event_id])
      event_id = @event.id

      @user = current_user
      attendant_id = @user.id

      # Amount in cents
      @amount = @event.price
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Price Event',
        :currency    => 'eur'
      )

      @attendance = Attendance.create(attendant_id: attendant_id, event_id: event_id)
      redirect_to controller: "attendances", action: "show", id: @attendance.id
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
