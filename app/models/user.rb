class User < ApplicationRecord
    has_secure_password
  
    has_many :reservations, dependent: :destroy
    has_many :flights, foreign_key: 'flight_id', dependent: :destroy
  
    validates :password, presence: true
    validates :fullname, :email, :username, uniqueness: true, presence: true
  end