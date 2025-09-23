class Status < ApplicationRecord
  has_many :todos, -> { order(position: :asc) }

  validates :name, presence: true, length: { maximum: 15 }
end
