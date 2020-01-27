class MainController < ApplicationController
  before_action :login_required, :except => [:index, :muscle, :body_part, :exercise, :hide_exercise, :search_string]
  include ApplicationHelper
  #respond_to :html, :js

  def index
    @liste = []
    #@muscles = Muscle.all_with_pic
    @body_parts = BodyPart.all.to_a
    @muscles = []
    @p_muscles = []
    @s_muscles = []
    #@a_muscles = []
    @current_user if logged_in?
    @trainingsplans = @current_user.trainingsplans if @current_user
    @trainingsplan = @trainingsplans.first
  end

  def muscle
    p "##################################"
    @name = params["name"]
    p @name
    @muscles = Muscle.where("name = ?",@name).to_a.uniq
    p @muscles
    @exercises = @muscles.first.exercises
    respond_to :js
  end

  def body_part
    @name = params[:name]
    if @name == "Alle"
      @p_muscles = Muscle.all
      @exercises = Exercise.all
      @s_muscles = []
    else
      body_part = BodyPart.where("name = ?",@name).first
      @muscleList = BodyPart.muscle_list(body_part.id)
      @exercises = body_part.x_ercise
      @p_muscles = @muscleList[0]#.uniq
      @s_muscles = @muscleList[1]
    end

    # @a_muscles = body_part.antagonist_muscles


    respond_to :js
#    render :update do |page|
#      page["muscles"].replace :partial=>"main/muscle"
#      page["body_part_selected"].replace :partial=>"main/body_part_selected"
#      page["body_part_text_selected"].replace_html params[:name]
#
#      page["muscle_text_header"].replace_html "Muskeln aller #{params[:name]}übungen"
#      page["muscle_selected"].replace "<div id="muscle_selected"></div>"
#
#      page["exercise_selected"].replace "<div id="exercise_selected"></div>"
#      page["exercises_text_header"].replace_html "Alle #{params[:name]}übungen"
#
#      page["exercises_text"].replace_html :partial=>"main/exercises_text"
#    end
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
    # @a_muscles = @exercise.antagonist_muscles

    #render :update do |page|
    #  page["body_part_selected"].replace_html ""
    #  page["exercise_selected"].replace :partial=>"main/exercise_selected"
    #  page["exercise_text_selected"].replace_html params[:exercise]["name"]
    #  page["open_exercise"].replace_html vertical_text(params[:exercise]["name"])
    #  page["exercise"].replace_html :partial=>"exercises/show"
    #end
  end

  def add_exercise
    @trainingsplan = Trainingsplan.find_by_id(params[:trainingsplan])
    @trainingsplan.exercises << Exercise.find_by_id(params[:exercise])
    #@current_user.exercises << Exercise.find_by_id(params[:exercise])
    respond_to :js
    #render :update do |page|
    #  page["user_selected"].replace :partial=>"main/user_selected"
    #end
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
    #render :update do |page|
    #  page["user_selected"].replace :partial=>"main/user_selected"
    #end
  end

  def switch_exercise

    return unless ExerciseToTrainingsplan.switch_exercise(params[:ettp_id_1], params[:ettp_id_2], @current_user.id)
    @trainingsplan = ExerciseToTrainingsplan.find_by_id(params[:ettp_id_1]).trainingsplan
    respond_to :js
      #render :update do |page|
      #  page["user_selected"].replace :partial=>"main/user_selected"
      #end
  end
end
