class Todo < ApplicationRecord
  belongs_to :user
  belongs_to :status
  acts_as_list scope: %i[status_id]

  validates :title, presence: true
  validates :body, presence: true
end
