class Trip < ApplicationRecord
  validates :city, presence: true
end
