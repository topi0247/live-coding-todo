class Status < ApplicationRecord
  has_many :todos, -> { order(position: :asc) }, dependent: :destroy, inverse_of: :status

  validates :name, presence: true, length: { maximum: 15 }
end
