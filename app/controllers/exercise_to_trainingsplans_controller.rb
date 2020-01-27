class ExerciseToTrainingsplansController < ApplicationController
  before_action :set_exercise_to_trainingsplan, only: [:show, :edit, :update, :destroy]

  # GET /exercise_to_trainingsplans
  # GET /exercise_to_trainingsplans.json
  def index
    @exercise_to_trainingsplans = ExerciseToTrainingsplan.all
  end

  # GET /exercise_to_trainingsplans/1
  # GET /exercise_to_trainingsplans/1.json
  def show
  end

  # GET /exercise_to_trainingsplans/new
  def new
    @exercise_to_trainingsplan = ExerciseToTrainingsplan.new
  end

  # GET /exercise_to_trainingsplans/1/edit
  def edit
  end

  # POST /exercise_to_trainingsplans
  # POST /exercise_to_trainingsplans.json
  def create
    @exercise_to_trainingsplan = ExerciseToTrainingsplan.new(exercise_to_trainingsplan_params)

    respond_to do |format|
      if @exercise_to_trainingsplan.save
        format.html { redirect_to @exercise_to_trainingsplan, notice: "Exercise to trainingsplan was successfully created." }
        format.json { render :show, status: :created, location: @exercise_to_trainingsplan }
      else
        format.html { render :new }
        format.json { render json: @exercise_to_trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_to_trainingsplans/1
  # PATCH/PUT /exercise_to_trainingsplans/1.json
  def update
    respond_to do |format|
      if @exercise_to_trainingsplan.update(exercise_to_trainingsplan_params)
        format.html { redirect_to @exercise_to_trainingsplan, notice: "Exercise to trainingsplan was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_to_trainingsplan }
      else
        format.html { render :edit }
        format.json { render json: @exercise_to_trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_to_trainingsplans/1
  # DELETE /exercise_to_trainingsplans/1.json
  def destroy
    @exercise_to_trainingsplan.destroy
    respond_to do |format|
      format.html { redirect_to exercise_to_trainingsplans_url, notice: "Exercise to trainingsplan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_to_trainingsplan
      @exercise_to_trainingsplan = ExerciseToTrainingsplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_to_trainingsplan_params
      params.fetch(:exercise_to_trainingsplan, {})
    end
end
