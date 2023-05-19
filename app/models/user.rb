class User < ApplicationRecord
  require 'securerandom'
  has_secure_password
  has_many :reservations

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true
end
