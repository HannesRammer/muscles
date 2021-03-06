class UsersController < ApplicationController
  ##before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :login_required, :except => [:new, :create]
  before_action :admin_required, :only => :destroy
  helper :all
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def trainingsplans
    @trainingsplan = Trainingsplan.new


    @trainingsplans = @current_user.trainingsplans.includes(:exercise_to_trainingsplans, exercises:[:tags] ).to_a

  end

  def exercises
    @exercises = @current_user.exercises

  end

  def videos
    @videos = @current_user.videos

  end

  def save_trainingsplan
    @trainingsplan = Trainingsplan.new
    @trainingsplan.name = params[:trainingsplan][:name]
    @trainingsplan.save
    @current_user.trainingsplans << @trainingsplan
    @trainingsplans = @current_user.trainingsplans
    respond_to :js
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        trainingsplan = Trainingsplan.new
        trainingsplan.name = "User #{@user.id}'s first workout"
        trainingsplan.duration=0
        trainingsplan.creator_id=@user.id
        trainingsplan.copied_from_trainingsplan_id = 0
        trainingsplan.sets= 0
        trainingsplan.public= 0
        trainingsplan.played= 0
        trainingsplan.save
        @user.trainingsplans << trainingsplan
        ApplicationMailer.with(user: @user).welcome_email(email: @user.email).deliver_now

        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
