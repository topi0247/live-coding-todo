class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  has_many :todos, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, on: :create
end
