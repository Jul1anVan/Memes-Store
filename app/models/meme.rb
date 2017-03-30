class Meme < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :product

  validates :name, :image, :presence => true
end
