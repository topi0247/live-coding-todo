class Status < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :name, presence: true, length: { minimum: 6 }
end
