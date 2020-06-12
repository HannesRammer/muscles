class ExerciseToMusclesController < ApplicationController
  before_action :set_exercise_to_muscle, only: [:show, :edit, :update, :destroy]
  before_action :admin_required
  # GET /exercise_to_muscles
  # GET /exercise_to_muscles.json
  def index
    @exercise_to_muscles = ExerciseToMuscle.all
  end

  # GET /exercise_to_muscles/1
  # GET /exercise_to_muscles/1.json
  def show
  end

  # GET /exercise_to_muscles/new
  def new
    @exercise_to_muscle = ExerciseToMuscle.new
  end

  # GET /exercise_to_muscles/1/edit
  def edit
  end

  # POST /exercise_to_muscles
  # POST /exercise_to_muscles.json
  def create
    @exercise_to_muscle = ExerciseToMuscle.new(exercise_to_muscle_params)

    respond_to do |format|
      if @exercise_to_muscle.save
        format.html { redirect_to @exercise_to_muscle, notice: "Exercise to muscle was successfully created." }
        format.json { render :show, status: :created, location: @exercise_to_muscle }
      else
        format.html { render :new }
        format.json { render json: @exercise_to_muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_to_muscles/1
  # PATCH/PUT /exercise_to_muscles/1.json
  def update
    respond_to do |format|
      if @exercise_to_muscle.update(exercise_to_muscle_params)
        format.html { redirect_to @exercise_to_muscle, notice: "Exercise to muscle was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise_to_muscle }
      else
        format.html { render :edit }
        format.json { render json: @exercise_to_muscle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_to_muscles/1
  # DELETE /exercise_to_muscles/1.json
  def destroy
    @exercise_to_muscle.destroy
    respond_to do |format|
      format.html { redirect_to exercise_to_muscles_url, notice: "Exercise to muscle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_to_muscle
      @exercise_to_muscle = ExerciseToMuscle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_to_muscle_params
      params.require(:exercise_to_muscle).permit(:muscle_id, :exercise_id, :body_part_id, :muscle_type)
    end
end
