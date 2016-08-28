class Task < ApplicationRecord
  belongs_to :project
  validates :name, presence: true,
                    length: { minimum: 3 }
  validates :status, inclusion: { in: %w(new in_process done),
    message: "%{value} is not a valid status" }
end
