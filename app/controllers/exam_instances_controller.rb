class ExamInstancesController < ApplicationController
  before_action :set_exam_instance, only: [:show, :edit, :load, :update, :destroy]
  before_action :set_menu
  before_action :authenticate_professor!

  # GET /exam_instances
  # GET /exam_instances.json
  def index
    @cursada = ''
    if session[:grade_id].present?
      @grades = Grade.where('id = ?',session[:grade_id])
      @cursada = @grades.first.year
      @exam_instances = ExamInstance.where('grade_id = ?',session[:grade_id])
    end
  end

  # GET /exam_instances/1
  # GET /exam_instances/1.json
  def show
    @show = 'exam_instances'
  end

  # GET /exam_instances/new
  def new
    @cursada = ''
    if session[:grade_id].present?
      @grades = Grade.where('id = ?',session[:grade_id])
      @cursada = @grades.first.year
    end
    @exam_instance = ExamInstance.new
  end

  # GET /exam_instances/1/edit
  def edit
    @cursada = ''
    if session[:grade_id].present?
      @grades = Grade.where('id = ?',session[:grade_id])
      @cursada = @grades.first.year
    end
  end

  # POST /exam_instances/1/score
  def score  
    exam_id = params['id']
    student_id = params['score'].keys[0]
    score = params['score'].values[0]
    exam = ExamInstance.find(exam_id)
    res = exam.set_result(student_id,score)
    respond_to do |format|
      if res
        format.json { render json: {:result => 'success', :id => exam_id}, status: :ok, location: @exam_instance }
      else
        format.json { render json: {:result => 'error', :id => exam_id}, status: :unprocessable_entity }
      end  
    end
  end
  
  # GET /exam_instances/1/load
  def load
    @cursada = ''
    if session[:grade_id].present?
      @grades = Grade.where('id = ?',session[:grade_id])
      @cursada = @grades.first.year
      @students = Student.where('grade_id = ?',session[:grade_id])
      #.results.where('exam_instance_id = ?',29)
    end
  end

  # POST /exam_instances
  # POST /exam_instances.json
  def create
    @exam_instance = ExamInstance.new(exam_instance_params)

    respond_to do |format|
      if @exam_instance.save
        format.html { redirect_to @exam_instance, notice: t(:Exam_created) }
        format.json { render :show, status: :created, location: @exam_instance }
      else
        format.html { render :new }
        format.json { render json: @exam_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_instances/1
  # PATCH/PUT /exam_instances/1.json
  def update
    respond_to do |format|
      if @exam_instance.update(exam_instance_params)
        format.html { redirect_to @exam_instance, notice: t(:Exam_updated) }
        format.json { render :show, status: :ok, location: @exam_instance }
      else
        format.html { render :edit }
        format.json { render json: @exam_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_instances/1
  # DELETE /exam_instances/1.json
  def destroy
    @exam_instance.destroy
    respond_to do |format|
      format.html { redirect_to exam_instances_url, notice: t(:Exam_destroyed) }
      format.json { head :no_content }
    end
  end
  
  private
    def set_menu
      @menu = 'exam_instances'
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_instance
      @exam_instance = ExamInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_instance_params
      params.require(:exam_instance).permit(:title, :exam_date, :min_score, :grade_id)
    end
end
