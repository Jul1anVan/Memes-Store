class OrderController < ApplicationController
  before_filter :authenticate_customer!
  before_action :initialize_order_variables, :check_pst, :check_gst, :check_hst

  def submit
    tax_total = (@tax * @order.subtotal).round(2)

    @order.total = @order.subtotal + tax_total

    @order.save
  end

  private

  def check_pst
    @tax += @customer.province.pst if @customer.province.pst.present?
    @order.pst_rate = @customer.province.pst if @customer.province.pst.present?
  end

  def check_gst
    @tax += @customer.province.gst if @customer.province.gst.present?
    @order.gst_rate = @customer.province.gst if @customer.province.gst.present?
  end

  def check_hst
    @tax += @customer.province.hst if @customer.province.hst.present?
    @order.hst_rate = @customer.province.hst if @customer.province.hst.present?
  end

  def initialize_order_variables
    @line_items = current_order.line_items
    @customer = current_customer
    @order = current_order
    @order.update(customer_id: @customer.id)
    @tax = 0.00
  end
end
