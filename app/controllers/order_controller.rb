class OrderController < ApplicationController
  before_filter  :authenticate_customer!

  def submit
    @line_items = current_order.line_items

    @customer = current_customer

    @order = current_order

    @order.update(:customer_id => @customer.id)

    tax = 0.00

    if @customer.province.pst.present?
      tax += @customer.province.pst
      @order.pst_rate = @customer.province.pst
    end

    if @customer.province.gst.present?
      tax += @customer.province.gst
      @order.gst_rate = @customer.province.gst
    end

    if @customer.province.pst.present?
      tax += @customer.province.hst
      @order.gst_rate = @customer.province.gst
    end

    tax_total = (tax * @order.subtotal).round(2)

    @order.total = @order.subtotal + tax_total

    @order.save
    #@customer =
  end

end
