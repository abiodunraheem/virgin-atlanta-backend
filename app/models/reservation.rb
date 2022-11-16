class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  validates :city, :date, presence: true
end
