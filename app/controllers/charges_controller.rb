class ChargesController < ApplicationController

    def new
        @event = Event.find(params[:event_id])
        @amount = @event.price
    end
    
    def create
      
      @event = Event.find(params[:event_id])

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
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
