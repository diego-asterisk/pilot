class Student < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :docket_number, presence: true, uniqueness: { scope: :grade_id }
  validates :grade_id, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'error format email' }
  
  belongs_to :grade
  has_many :results
  has_many :exam_instances, :through => :results
end
