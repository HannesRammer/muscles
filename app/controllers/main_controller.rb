class MainController < ApplicationController
  before_action :login_required, :except => [:index, :muscle, :body_part, :exercise, :hide_exercise, :search_string,:impressum]
  include ApplicationHelper
  #respond_to :html, :js

  def index
    @liste = []
    #@muscles = Muscle.all_with_pic
    @muscles = Muscle.all
    @muscles_selected = []
    @body_parts = BodyPart.all.to_a
    @p_muscles = @muscles
    @exercises = Exercise.where(visible: true).order("id asc").all
    @s_muscles = []
    #@a_muscles = []
    @current_user if logged_in?
    @trainingsplans = @current_user.trainingsplans if @current_user
    @trainingsplan = @trainingsplans.first if @trainingsplans
  end


  def muscle
    #p "##################################"
    @name = params["name"]
    #p @name
    @muscles = Muscle.where("name = ?",@name).to_a.uniq
    @muscles_selected = @muscles
    @exercises = @muscles.first.exercises
    respond_to :js
  end

  def body_part
    @name = params[:name]
    if @name == "Alle"
      @p_muscles = Muscle.all
      @exercises = Exercise.where(visible: true).order("id asc").all
      @s_muscles = []
    else
      body_part = BodyPart.where("name = ?",@name).first
      @muscle_list = BodyPart.muscle_list(body_part.id)
      @exercises = body_part.x_ercise
      @p_muscles = @muscle_list[0]#.uniq
      @s_muscles = @muscle_list[1]
    end
    respond_to :js
  end

  def search_string

    @exercises = Exercise.load_exercises(params[:name])
    respond_to :js
  end

  def exercise
    @name = params["name"]
    @exercise = Exercise.find_by_name(@name)
    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
    respond_to :js
  end

  def add_exercise
    @trainingsplan = Trainingsplan.find_by_id(params[:trainingsplan])
    @trainingsplan.exercises << Exercise.find_by_id(params[:exercise])
    #@current_user.exercises << Exercise.find_by_id(params[:exercise])
    respond_to :js
  end


  def hide_exercise
    render :update do |page|
      page["exercise"].replace_html ""
    end
  end

  def remove_exercise
    @ett = ExerciseToTrainingsplan.find_by_id(params[:ettp_id])
    @trainingsplan = @ett.trainingsplan
    user_id = Trainingsplan.user(@ett.id).id

    ExerciseToTrainingsplan.destroy(@ett.id) if @current_user.id == user_id
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
