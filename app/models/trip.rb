class Trip < ApplicationRecord
  validates :city, presence: true
  belongs_to :user
end
