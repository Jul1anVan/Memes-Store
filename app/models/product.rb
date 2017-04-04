class Product < ApplicationRecord
  has_many :line_items
  belongs_to :category
  belongs_to :meme

  validates :name, :price, :description, :price, :stock, :presence => true
end
