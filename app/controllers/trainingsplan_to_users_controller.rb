class TrainingsplanToUsersController < ApplicationController
  before_action :set_trainingsplan_to_user, only: [:show, :edit, :update, :destroy]

  # GET /trainingsplan_to_users
  # GET /trainingsplan_to_users.json
  def index
    @trainingsplan_to_users = TrainingsplanToUser.all
  end

  # GET /trainingsplan_to_users/1
  # GET /trainingsplan_to_users/1.json
  def show
  end

  # GET /trainingsplan_to_users/new
  def new
    @trainingsplan_to_user = TrainingsplanToUser.new
  end

  # GET /trainingsplan_to_users/1/edit
  def edit
  end

  # POST /trainingsplan_to_users
  # POST /trainingsplan_to_users.json
  def create
    @trainingsplan_to_user = TrainingsplanToUser.new(trainingsplan_to_user_params)

    respond_to do |format|
      if @trainingsplan_to_user.save
        format.html { redirect_to @trainingsplan_to_user, notice: "Trainingsplan to user was successfully created." }
        format.json { render :show, status: :created, location: @trainingsplan_to_user }
      else
        format.html { render :new }
        format.json { render json: @trainingsplan_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainingsplan_to_users/1
  # PATCH/PUT /trainingsplan_to_users/1.json
  def update
    respond_to do |format|
      if @trainingsplan_to_user.update(trainingsplan_to_user_params)
        format.html { redirect_to @trainingsplan_to_user, notice: "Trainingsplan to user was successfully updated." }
        format.json { render :show, status: :ok, location: @trainingsplan_to_user }
      else
        format.html { render :edit }
        format.json { render json: @trainingsplan_to_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainingsplan_to_users/1
  # DELETE /trainingsplan_to_users/1.json
  def destroy
    @trainingsplan_to_user.destroy
    respond_to do |format|
      format.html { redirect_to trainingsplan_to_users_url, notice: "Trainingsplan to user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainingsplan_to_user
      @trainingsplan_to_user = TrainingsplanToUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainingsplan_to_user_params
      params.fetch(:trainingsplan_to_user, {})
    end
end
