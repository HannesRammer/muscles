class MainController < ApplicationController
  before_action :login_required, :except => [:index, :muscle, :body_part, :exercise, :search_string, :impressum]
  include ApplicationHelper
  #respond_to :html, :js

  def index
    @liste = []
    #@muscles = Muscle.all_with_pic
    @muscles = Muscle.all
    @muscles_selected = []
    @body_parts = BodyPart.all.to_a
    @p_muscles = [] #@muscles
    @exercises = Exercise.where(visible: true).order("name asc").all
    @s_muscles = []
    @a_muscles = []
    # @muscle = @muscles.first
    @primary = []
    @secondary = []
    @antagonist = []
    @current_user if logged_in?
    @trainingsplans = @current_user.trainingsplans if @current_user
    @trainingsplan = nil
    if params[:trainingsplan_id]
      @trainingsplan = Trainingsplan.find_by_id(params[:trainingsplan_id])
    else
      @trainingsplan = @trainingsplans.first if @trainingsplans
    end
  end


  def muscle
    #p "##################################"
    @name = params["name"]
    #p @name
    @muscles = Muscle.where("name = ?", @name).to_a.uniq
    @muscles_selected = @muscles
    @muscle = @muscles.first
    #@exercises = @primary_exercises.exercises
    @primary = @muscle.primary_exercises
    @secondary = @muscle.secondary_exercises
    @antagonist = @muscle.antagonist_exercises
    respond_to :js
  end

  def body_part
    @name = params[:name]
    if @name == "Alle"
      @p_muscles = Muscle.all
      @exercises = Exercise.where(visible: true).order("name asc").all
      @s_muscles = []
      @a_muscles = []
    else
      body_part = BodyPart.where("name = ?", @name).first
      @muscle_list = BodyPart.muscle_list(body_part.id)
      @exercises = body_part.x_ercise
      @p_muscles = @muscle_list[0] #.uniq
      @s_muscles = @muscle_list[1]
      @a_muscles = []
    end
    respond_to :js
  end

  def search_string
    @name = params[:name]
    @exercises = Exercise.load_exercises(@name)
    respond_to :js
  end

  def exercise
    @name = params["name"]
    trainingsplan_id = params["trainingsplan_id"]
    @exercise = Exercise.find_by_name(@name)
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
    @a_muscles = @exercise.antagonist_muscles
    @video = @exercise.selected_video(trainingsplan_id)
    respond_to :js
  end

  def add_exercise
    unless creator_of_trainingsplan
      redirect_to root_path
      flash[:notice] = "not your exercise."

    end
    trainingsplan_id = params[:trainingsplan_id]
    exercise_id = params[:exercise]
    tpte = ExerciseToTrainingsplan.find_by(trainingsplan_id: trainingsplan_id, exercise_id: exercise_id)
    @trainingsplan = Trainingsplan.find_by_id(trainingsplan_id)
    if tpte
      flash[:notice] = "Exercise already in your trainingslan."


    else


      @trainingsplan.exercises << Exercise.find_by_id(exercise_id)
      tpte = ExerciseToTrainingsplan.find_by(trainingsplan_id: trainingsplan_id, exercise_id: exercise_id)
      tpte.reps = 12
      tpte.duration = 45
      tpte.pause = 120
      tpte.unit = "reps"
      if tpte.save
        flash[:notice] = "Exercise added to Workout: #{@trainingsplan.name}."
      else
        flash[:notice] = "some error while saving ExerciseToTrainingsplan t_id:#{trainingsplan_id} e_id #{exercise_id}"
      end

    end

    respond_to :js
    #@current_user.exercises << Exercise.find_by_id(params[:exercise])

  end

  def remove_exercise
    @ett = ExerciseToTrainingsplan.find_by_id(params[:ettp_id])


    @trainingsplan = @ett.trainingsplan
    user_id = Trainingsplan.user(@ett.id).id
    if @current_user.id == user_id
      flash[:notice] = "Exercise removed"
      ExerciseToTrainingsplan.destroy(@ett.id)

    else
      flash[:notice] = "not your trainingsplan"

    end
    respond_to :js
  end

  def switch_exercise

    return unless ExerciseToTrainingsplan.switch_exercise(params[:ettp_id_1], params[:ettp_id_2], @current_user.id)
    @trainingsplan = ExerciseToTrainingsplan.find_by_id(params[:ettp_id_1]).trainingsplan
    respond_to :js
  end

  def impressum

  end
end
