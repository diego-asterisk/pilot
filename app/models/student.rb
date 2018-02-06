class Student < ApplicationRecord
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :docket_number, presence: true, uniqueness: { scope: :grade_id }
  validates :grade_id, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'error format email' }
  
  belongs_to :grade
  has_many :results, dependent: :delete_all
  has_many :exam_instances, :through => :results
  
  def score(eval_id)
    res = self.results.where('exam_instance_id = ?',eval_id)
    if res.count > 0
      res.first.score
    end
  end
  
  def is_missing(eval_id)
    res = self.results.where('exam_instance_id = ?',eval_id)
    res.count == 0
  end
  
end
