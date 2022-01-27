class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :name, :password
  validates_presence_of :email, uniqueness: true

  has_many :categories
end
