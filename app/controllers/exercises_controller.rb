class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
  before_action :login_required, :except => [:all]
  #before_action :is_owner, only: [:edit]
  # GET /exercises
  # GET /exercises.json

  def index
    @exercises = @current_user.exercises.where(visible:true).order("name asc") || []
      #@exercises = Exercise.where(id:@current_user.id,visible: true).order("id asc").all  || []

      #@exercises = Exercise.where(visible: true).order("id asc").all
    #@exercises = Exercise.where(visible: false).order("id asc").all
  end


  def toggle_muscle
    muscle_id = Muscle.find_by_name(params[:name]).id
    exercise_id = params[:eid]
    muscle_type = params[:muscle_type]

    exercise_to_muscle = ExerciseToMuscle.find_by_exercise_id_and_muscle_id(exercise_id,muscle_id)
    body_part_id = ExerciseToMuscle.find_by_muscle_id(muscle_id).body_part

    if exercise_to_muscle == nil
      @exercise_to_muscle = ExerciseToMuscle.new(:muscle_id=>muscle_id,:muscle_type=>muscle_type,:exercise_id=>exercise_id,:body_part=>body_part_id)
      if @exercise_to_muscle.save
        @exercise = Exercise.find_by_id(params[:eid])
        else
          @exercise = Exercise.find_by_id(params[:eid])
      end
    else
      exercise_to_muscle.destroy
    end
    @exercise = Exercise.find_by_id(params[:eid])
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles

    respond_to :js
  end

  def all
    @exercises = Exercise.visible_exercises.order("name asc")
    @current_user if logged_in?
    @trainingsplans = @current_user.trainingsplans if @current_user
    @trainingsplan = @trainingsplans.first
  end

  def update_selected_exercise
    @exercise = Exercise.find_by_id(params[:id])
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
    @video = @exercise.selected_video(nil)
    respond_to :js
  end
  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find_by_id(params[:id])
    @video =  @exercise.selected_video(nil)
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
    @video = @exercise.selected_video(nil)
    if is_exercise_owner

      @p_muscles= @exercise.primary_muscles
      @s_muscles= @exercise.secondary_muscles
    else
      respond_to do |format|
        format.html { redirect_to @exercise, notice: "Exercise not yours to edit."  }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /exercises
  # POST /exercises.json
  def create

    @exercise = Exercise.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        @current_user.exercises << @exercise
        format.html { redirect_to :action => :edit, :id=>@exercise.id,  notice: "Exercise was successfully created." }
        format.json { render :edit, status: :created, location: @exercise }
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
      if is_exercise_owner && @exercise.update(exercise_params)
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
    @exercise.visible = false
    if is_exercise_owner && @exercise.save


      respond_to do |format|
        format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @exercise, notice: "Not your exercise to destroy." }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:name, :description, :main_description, :how_to, :how_not_to, :info, :exercise_type,:default_video_id)
    end
end
