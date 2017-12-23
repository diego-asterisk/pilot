class ExamInstance < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :grade_id, presence: true

  belongs_to :grade
  has_many :results
  has_many :students, :through => :results
  
  
  def aprobado?(nota)
    nota >= self.min_score
  end

end
