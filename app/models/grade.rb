class Grade < ApplicationRecord
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }, uniqueness: true
end


