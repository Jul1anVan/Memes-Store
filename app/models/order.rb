class Order < ApplicationRecord
  has_many :line_items
  belongs_to :customer
  belongs_to :status
  before_validation :set_order_status
  before_save :update_subtotal


  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    line_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private
  def set_order_status
    self.status_id = 1 #if self.status_id.nil?
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
