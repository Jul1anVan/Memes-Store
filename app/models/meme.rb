class Meme < ApplicationRecord
  has_many :product

  validates :name, :image, :presence => true
end
