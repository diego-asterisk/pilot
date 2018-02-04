class Grade < ApplicationRecord
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 2000 }, uniqueness: true
  
  has_many :exam_instances, dependent: :destroy
  has_many :students, dependent: :destroy

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
  
  def resume_headers
    # Columnas Legajo y Alumno
    @columns = [I18n.t(:Docket_number),I18n.t(:Student)]
    nota = I18n.t(:Score)
    aprobado = I18n.t(:Approved)
    exam = self.exam_instances.order('exam_date ASC')
    exam.each do |e|
      @columns.push(e.title + ' ' + nota, aprobado)
    end
    @columns
  end  
  def resume
    ausente = I18n.t(:Missing)
    no = I18n.t(:Noi)
    yes = I18n.t(:Yesi)
    exam = self.exam_instances.order('exam_date ASC')
    alumnos = self.students
    cabecera = alumnos.map do |a|
      [a.id, a.docket_number, a.first_name + ' ' + a.last_name]
    end
    linea = exam.map { |e| e.resume(alumnos) }
    @info = []
    cabecera.each do |a|
      id_alumno = a[0]
      resultados = [a[1], a[2]]
      linea.each do |r|
        if r[id_alumno]
          resultados.push( r[id_alumno][0], r[id_alumno][1]? yes : no )
        else
          resultados.push( ausente, no )  
        end
      end
      @info.push(resultados)
    end  
    @info
  end

  def resume_all
    total_alumnos = self.students.size
    exam = self.exam_instances
    linea = exam.map { |e| e.resume_all(total_alumnos) }
  end

end



