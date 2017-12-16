class ExamInstance < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :grade_id, presence: true

  belongs_to :grade
  has_and_belongs_to_many :students
end
