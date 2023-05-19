class User < ApplicationRecord
  require 'securerandom'
  has_secure_password
  has_many :reservations

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validate :username, presence: true, uniqueness: true
end
