class ChargesController < ApplicationController
  def new
    @amount = current_order.total.to_f * 100
    @description = 'Description of Charge'
  end

  def create
    amount = (current_order.total.to_f * 100).to_i
    @customer = Stripe::Customer.create(email:  params[:stripeEmail],
                                        source: params[:stripeToken])
    @charge = Stripe::Charge.create(customer:    @customer.id,
                                    amount:      amount,
                                    description: 'Rails Stripe customer',
                                    currency:    'cad')

    order = current_order
    if @charge.paid && @charge.amount == amount
      order.status_id = 2
      order.stripe_charge_id = @charge.id
      order.save
      session.delete(:order_id)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
