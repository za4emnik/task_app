class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :name, presence: true,
                    length: { minimum: 3 }
end
