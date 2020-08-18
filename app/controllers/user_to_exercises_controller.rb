class UserToExercisesController < ApplicationController
  before_action :set_user_to_exercise, only: [:show, :edit, :update, :destroy]
  before_action :admin_required
  # GET /user_to_exercises
  # GET /user_to_exercises.json
  def index
    @user_to_exercises = UserToExercise.all
  end

  # GET /user_to_exercises/1
  # GET /user_to_exercises/1.json
  def show
  end

  # GET /user_to_exercises/new
  def new
    @user_to_exercise = UserToExercise.new
  end

  # GET /user_to_exercises/1/edit
  def edit
  end

  # POST /user_to_exercises
  # POST /user_to_exercises.json
  def create
    @user_to_exercise = UserToExercise.new(user_to_exercise_params)

    respond_to do |format|
      if @user_to_exercise.save
        format.html { redirect_to @user_to_exercise, notice: "User to exercise was successfully created." }
        format.json { render :show, status: :created, location: @user_to_exercise }
      else
        format.html { render :new }
        format.json { render json: @user_to_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_to_exercises/1
  # PATCH/PUT /user_to_exercises/1.json
  def update
    respond_to do |format|
      if @user_to_exercise.update(user_to_exercise_params)
        format.html { redirect_to @user_to_exercise, notice: "User to exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @user_to_exercise }
      else
        format.html { render :edit }
        format.json { render json: @user_to_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_to_exercises/1
  # DELETE /user_to_exercises/1.json
  def destroy
    @user_to_exercise.destroy
    respond_to do |format|
      format.html { redirect_to user_to_exercises_url, notice: "User to exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_to_exercise
    @user_to_exercise = UserToExercise.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_to_exercise_params
    params.require(:user_to_exercise).permit(:user_id, :exercise_id)
  end
end
