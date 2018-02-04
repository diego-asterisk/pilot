class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_menu
  before_action :authenticate_professor!

  # GET /students
  # GET /students.json
  def index
    @cursada = ''
    if session[:grade_id].present?
      @grades = Grade.where('id = ?',session[:grade_id])
      @cursada = @grades.first.year
      @students = Student.where('grade_id = ?',session[:grade_id])
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @show = 'students'
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    @grades = Grade.where('id = ?',session[:grade_id])
    @cursada = @grades.first.year
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: t(:Student_created) }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: t(:Student_updated) }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: t(:Student_destroyed) }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = 'students'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:email, :last_name, :first_name, :document_number, :docket_number, :grade_id)
    end
end
