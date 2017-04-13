class Province < ApplicationRecord
  has_many :customer

  validates :name, presence: true
end
