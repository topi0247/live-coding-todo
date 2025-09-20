class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :status

  validates :title, presence: true
  validates :body, presence: true
end
