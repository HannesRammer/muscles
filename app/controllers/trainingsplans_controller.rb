class TrainingsplansController < ApplicationController
  before_action :set_trainingsplan, only: [ :edit, :update, :destroy]
  before_action :login_required,except: [:show, :exercise]

  #before_action :creator_of_trainingsplan, only:[:edit,:update,:destroy]

  # GET /trainingsplans
  # GET /trainingsplans.json
  def index
    @trainingsplans = Trainingsplan.all
  end

  # GET /trainingsplans/1
  # GET /trainingsplans/1.json
  def show
    @current_user = current_user
    @trainingsplan = Trainingsplan.find_by_id(params[:id])
    @exercises = @trainingsplan.exercises

    if @exercises.first
      @exercise = @exercises.first
      @ett = ExerciseToTrainingsplan.where(trainingsplan_id:@trainingsplan.id,exercise_id:@exercise.id).order("id asc").to_a.first
      @muscles = @exercises.first.muscles
      @muscles_selected = []
      @p_muscles = []#@exercises.first.primary_muscles
      @s_muscles = []#@exercises.first.secondary_muscles
      @a_muscles = []#@exercises.first.antagonist_muscles
    else
      @exercise = nil
      @ett = nil
      @muscles = []
      @muscles_selected = []
      @p_muscles = []
      @s_muscles = []
      @a_muscles = []
    end

  end

  # GET /trainingsplans/new
  def new
    @trainingsplan = Trainingsplan.new
  end

  # GET /trainingsplans/1/edit
  def edit
    @trainingsplan = Trainingsplan.find_by_id(params[:id])

    @etts = @trainingsplan.exercise_to_trainingsplans #ExerciseToTrainingsplan.where(:trainingsplan_id=>@trainingsplan.id).order("id asc")


    unless creator_of_trainingsplan
      redirect_to trainingsplan_path(params[:id])
    end
  end

  def exercise
    @name = params["name"]
    @exercise = Exercise.find_by_name(@name)
    @ett = ExerciseToTrainingsplan.find_by(trainingsplan_id:params["id"],exercise_id:@exercise.id)

    @p_muscles = @exercise.primary_muscles
    @s_muscles = @exercise.secondary_muscles
    @a_muscles = @exercise.antagonist_muscles
    respond_to :js


    #render :update do |page|
    #  page["body_part_selected"].replace_html ""
    #  page["exercise_selected"].replace :partial=>"main/exercise_selected"
    #  page["exercise_text_selected"].replace_html params[:exercise]["name"]
    #  page["open_exercise"].replace_html vertical_text(params[:exercise]["name"])
    #  page["exercise"].replace_html :partial=>"exercises/show"
    #end
  end

  def remove_exercise
    unless creator_of_trainingsplan
      redirect_to trainingsplan_path(params[:id])
    end
    @ett = ExerciseToTrainingsplan.find_by_id(params[:ettp_id])
    @trainingsplan = @ett.trainingsplan
    user_id = Trainingsplan.user(@ett.id).id
    @exercises = @trainingsplan.exercises
    ExerciseToTrainingsplan.destroy(@ett.id) if @current_user.id == user_id
    respond_to :js
    #render :update do |page|
    #  page["user_selected"].replace :partial=>"main/user_selected"
    #end
  end

  def switch_exercise
    unless creator_of_trainingsplan
      redirect_to trainingsplan_path(params[:id])
    end
    return unless ExerciseToTrainingsplan.switch_exercise(params[:ettp_id_1], params[:ettp_id_2], @current_user.id)
    @trainingsplan = ExerciseToTrainingsplan.find_by_id(params[:ettp_id_1]).trainingsplan
    @exercises = @trainingsplan.exercises
    respond_to :js
    #render :update do |page|
    #  page["user_selected"].replace :partial=>"main/user_selected"
    #end
  end

  def get_exercises
    @trainingsplan = Trainingsplan.find_by_id(params[:trainingsplan_id])
    @exercises = @trainingsplan.exercises
    respond_to :js
  end

  def load_trainingsplans
    @trainingsplans= @current_user.trainingsplans
    @exercise_id = params[:exercise]
    #@exerciseId = params
    respond_to :js
  end

  # POST /trainingsplans
  # POST /trainingsplans.json
  def create
    @trainingsplan = Trainingsplan.new(trainingsplan_params)

    respond_to do |format|
      if @trainingsplan.save
        @current_user.traingsplans << @trainingsplan
        format.html { redirect_to @trainingsplan, notice: "Trainingsplan was successfully created." }
        format.json { render :show, status: :created, location: @trainingsplan }
      else
        format.html { render :new }
        format.json { render json: @trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainingsplans/1
  # PATCH/PUT /trainingsplans/1.json
  def update
    unless creator_of_trainingsplan
      redirect_to trainingsplan_path(params[:id])
    end
    respond_to do |format|
      @trainingsplan.name = params[:trainingsplan][:name]
      @etts = @trainingsplan.exercise_to_trainingsplans.to_a
      params["exercise"].each do |exercise|
        ett = ExerciseToTrainingsplan.find_by(trainingsplan_id:@trainingsplan.id,exercise_id:exercise[0])
        exercise_to_trainingsplan_param = exercise[1]
        changed = false
        if ett.reps != exercise_to_trainingsplan_param[:reps]
          ett.reps = exercise_to_trainingsplan_param[:reps]
          changed = true
        end
        if ett.duration != exercise_to_trainingsplan_param[:duration]
          ett.duration = exercise_to_trainingsplan_param[:duration]
          changed = true
        end
        if ett.pause != exercise_to_trainingsplan_param[:pause]
          ett.pause = exercise_to_trainingsplan_param[:pause]
          changed = true
        end
        if ett.unit != exercise_to_trainingsplan_param[:unit]
          ett.unit = exercise_to_trainingsplan_param[:unit]
          changed = true
        end
        if changed
          ett.save
        end
      end
      if @trainingsplan.save
        @exercises = @trainingsplan.exercises
        format.html { redirect_to @trainingsplan, notice: "Trainingsplan was successfully updated." }
        #format.html { redirect_to @trainingsplan, notice: "Trainingsplan was successfully updated." }
        format.json { render :edit, status: :ok, location: @trainingsplan }
      else
        format.html { render :edit }
        format.json { render json: @trainingsplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainingsplans/1
  # DELETE /trainingsplans/1.json
  def destroy
    unless creator_of_trainingsplan
      redirect_to trainingsplan_path(params[:id])
    end
    @trainingsplan.destroy
    respond_to do |format|
      format.html { redirect_to user_trainingsplans_path, notice: "Trainingsplan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def creator_of_trainingsplan
    ttu = current_user && TrainingsplanToUser.find_by(trainingsplan_id:params[:id],user_id:@current_user.id)

  end
    # Use callbacks to share common setup or constraints between actions.
    def set_trainingsplan
      @trainingsplan = Trainingsplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainingsplan_params
      params.require(:trainingsplan).permit(:exercises)
    end

end
