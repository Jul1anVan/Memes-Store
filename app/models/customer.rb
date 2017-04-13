class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :province
  has_many :order

  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ -]?\d{1}[A-Z]{1}\d{1}\z/

  validates :province_id, :first_name, :last_name, :address, :city, :postal_code, presence: true
  validates :email, uniqueness: true
  validates :postal_code, format: { with: canadian_postal_code }

end
