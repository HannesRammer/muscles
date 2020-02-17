class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :login_required#, :except => [:index, :muscle, :body_part, :exercise, :hide_exercise, :search_string]
  # GET /exercises
  # GET /exercises.json

  def index
    @exercises = Exercise.where(visible: true).order("id asc").all
  end


  def toggle_muscle
    @muscle = Muscle.find_by_name(params[:name])
    @exercise = Exercise.find_by_id(params[:eid])
    @muscle_type = params[:muscle_type]
    @exercise_to_muscles = @exercise.exercise_to_muscles
    @exercise_to_muscle = ExerciseToMuscle.find_by_exercise_id_and_muscle_id(params[:eid],@muscle.id)


    if @exercise_to_muscle == nil
      @exercise_to_muscle = @exercise_to_muscles.first.dup
      @exercise_to_muscle.exercise_id = @exercise.id
      @exercise_to_muscle.muscle_id=@muscle.id
      @exercise_to_muscle.muscle_type = @muscle_type
      @exercise_to_muscle.save
    else
      @exercise_to_muscle.destroy
    end
    @exercise = Exercise.find_by_id(params[:eid])
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles

    respond_to :js
  end

  def all
    @exercises = Exercise.visibleExercises
    @current_user if logged_in?
    @trainingsplans = @current_user.trainingsplans if @current_user
    @trainingsplan = @trainingsplans.first
  end

  def update_selected_exercise
    @exercise = Exercise.find_by_id(params[:id])
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
    respond_to :js
  end
  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find_by_id(params[:id])
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find_by_id(params[:id])
    @p_muscles= @exercise.primary_muscles
    @s_muscles= @exercise.secondary_muscles
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        format.html { render :new }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    @exercise = Exercise.find_by_id(params[:id])
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to @exercise, notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:name, :image1, :description, :image2, :main_description, :how_to, :how_not_to, :info, :exercise_type)
    end
end
