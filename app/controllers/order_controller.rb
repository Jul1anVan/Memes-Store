class OrderController < ApplicationController
  before_filter  :authenticate_customer!

  def submit
    @line_items = current_order.line_items
    #@customer =
  end

end
