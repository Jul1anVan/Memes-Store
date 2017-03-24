class Order < ApplicationRecord
  has_many :line_item
  belongs_to :customer
  belongs_to :status
end
