class Grade < ApplicationRecord
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }, uniqueness: true
  
  def self.find_current(grade_id)
    return grade_id if defined?(grade_id) and grade_id.present?
    if self.exists?
      return self.order('year DESC').first.id
    end
    return ''
  end
end



