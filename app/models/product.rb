class Product < ApplicationRecord
  has_many :line_item
  belongs_to :category
  belongs_to :meme
end
