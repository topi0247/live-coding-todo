class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
end
