class PaymentsController < ApplicationController
  def new
    @amount = 44.0
    @description = 'Um produto muito legal!!!!!!'
  end

  def create
    customer = Stripe::Customer.create({
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
    })

    charge = Stripe::Charge.create({
      :customer => customer.id,
      :amount => params[:amount],
      :description => params[:description],
      :currency => 'brl'
    })
binding.break
    rescue Stripe::CardError => e
      redirect_to new_payment_path
  end
end
