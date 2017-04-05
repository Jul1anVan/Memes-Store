class OrderController < ApplicationController
  before_filter  :authenticate_customer!



end
