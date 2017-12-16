class ExamInstancesController < ApplicationController
  before_action :set_exam_instance, only: [:show, :edit, :update, :destroy]

  # GET /exam_instances
  # GET /exam_instances.json
  def index
    @exam_instances = ExamInstance.all
  end

  # GET /exam_instances/1
  # GET /exam_instances/1.json
  def show
  end

  # GET /exam_instances/new
  def new
    @exam_instance = ExamInstance.new
  end

  # GET /exam_instances/1/edit
  def edit
  end

  # POST /exam_instances
  # POST /exam_instances.json
  def create
    @exam_instance = ExamInstance.new(exam_instance_params)

    respond_to do |format|
      if @exam_instance.save
        format.html { redirect_to @exam_instance, notice: 'Exam instance was successfully created.' }
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
        format.html { redirect_to @exam_instance, notice: 'Exam instance was successfully updated.' }
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
      format.html { redirect_to exam_instances_url, notice: 'Exam instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_instance
      @exam_instance = ExamInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_instance_params
      params.require(:exam_instance).permit(:title, :exam_date, :min_score)
    end
end
