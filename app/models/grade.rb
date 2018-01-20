class Grade < ApplicationRecord
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }, uniqueness: true
  
  def self.find_current(grade_id)
    if grade_id.nil?
       ''
    else
      self.find_current_id(grade_id)
    end
  end
  def self.find_current_id(grade_id)
    if self.exists? grade_id
       grade_id
    else
       self.find_id_alterno()
    end
  end 
  def self.find_id_alterno()
    alternativo = self.order('year DESC').first
    if alternativo.nil?
       ''
    else
       alternativo.id
    end
  end
end



