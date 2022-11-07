class Flight < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_float: true }
end
