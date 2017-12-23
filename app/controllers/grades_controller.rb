class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :set_menu
  before_action :authenticate_professor!

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.all
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # GET /summary
  def summary
    @cursada = ''
    if session[:grade_id].present?
      @columns = ['Legajo','Alumno']
      @totales = []
      @totales_aprobado = Hash.new
      @totales_desaprobado = Hash.new
      @totales_ausente = Hash.new
      @grades = Grade.where('id = ?',session[:grade_id])
      @cursada = @grades.first.year
      @students = Student.where('grade_id = ?',session[:grade_id])
      @exams = ExamInstance.where('grade_id = ?',session[:grade_id]).order('exam_date ASC')
      @exams.each do |e|
         @columns.push(e.title + ' Nota', 'Aprobado')
         @totales_ausente[e.id] = 0
         @totales_aprobado[e.id] = 0
         @totales_desaprobado[e.id] = 0
      end
      @results = []
      @students.each do |s|
        parcial = [s.docket_number,s.first_name + ' ' + s.last_name]
        @exams.each do |e|
          r = Result.where('exam_instance_id = ? and student_id = ?',e.id, s.id)
          nota = 'Ausente'
          aprobado = 'No'
          if r.count > 0
            nota = r.first.score
            aprobado = 'Si' if e.aprobado? nota
          end
          if 'Ausente'==nota 
            @totales_ausente[e.id] = @totales_ausente[e.id] + 1
          elsif 'No'==aprobado 
            @totales_aprobado[e.id] = @totales_aprobado[e.id] + 1
          else
             @totales_desaprobado[e.id] = @totales_desaprobado[e.id] + 1
          end          
          parcial.push(nota, aprobado)
        end  
        @results.push(parcial)
      end
      # Totales
      @exams.each do |e|
         porcentaje = 0
         presentes = @totales_aprobado[e.id].to_i + @totales_desaprobado[e.id].to_i
         if presentes > 0
           porcentaje = (@totales_aprobado[e.id].to_f / presentes.to_f) * 100
         end
         @totales.push([e.title, @totales_aprobado[e.id], @totales_desaprobado[e.id], @totales_ausente[e.id], porcentaje.round(2)])
      end
    end
    @menu = 'summary'
  end

  # GET /selected
  def selected
    session[:grade_id] = params[:id]
    p params[:id]
#    algo malo
    redirect_to '/grades'
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = 'grades'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:year)
    end
end
