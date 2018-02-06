class ExamInstance < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :grade_id, presence: true

  belongs_to :grade
  has_many :results, dependent: :delete_all
  has_many :students, :through => :results
  
  
  def aprobado?(nota)
    nota >= self.min_score
  end

  def set_result(student_id,score)
    if score.blank?
      self.set_missing(student_id)
    else
      self.set_score(student_id,score)
    end
  end
  
  def set_missing(student_id)
    res = Result.where('exam_instance_id = ? and student_id = ?',self.id, student_id).first
    res.destroy if !res.nil?
  end
  
  def set_score(student_id,score)
    res = Result.where('exam_instance_id = ? and student_id = ?',self.id, student_id).first
    if res.nil?
      res = Result.new
      res.student_id = student_id
      res.exam_instance_id = self.id
    end
    res.score = score
    res.save
  end
          
  def resume(alumnos)
    res = self.results
    linea = res.map do |r|
      [r.student_id, [r.score, self.aprobado?(r.score)]]
    end.to_h
  end
  
  def resume_all(total)
    res = self.results.select do |r| 
      alumno = r.student;
      alumno.grade_id == self.grade_id 
    end
    ausentes = total - res.size
    res.map { |r| p r.score.to_s + ' - ' + self.min_score.to_s } 
    aprobados = res.select { |r| self.aprobado? r.score } .size
    desaprobados = total - ausentes - aprobados
    presentes = aprobados + desaprobados
    porcentaje = 0
    if presentes > 0
      porcentaje = (aprobados.to_f / presentes.to_f) * 100
    end
    [self.title, aprobados, desaprobados, ausentes, porcentaje.round(2)]
  end

end
