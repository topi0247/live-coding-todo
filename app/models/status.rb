class Status < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }
end
