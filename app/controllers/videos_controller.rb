class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :login_required #, :except => [:index, :muscle, :body_part, :exercise, :hide_exercise, :search_string, :impressum]
  before_action :admin_required
  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all


  end

  # GET /videos/1
  # GET /videos/1.json
  def show

  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    unless creator_of_video
      redirect_to videos_path(params[:id])
    end
  end

  # POST /videos
  # POST /videos.json
  def create

    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        current_user.videos << @video
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    unless creator_of_video
      redirect_to videos_path(params[:id])
    end
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    #@video.destroy
    #respond_to do |format|
    #  format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private

  def creator_of_video
    ttu = current_user && UserToVideo.find_by(video_id: params[:id], user_id: current_user.id)

  end

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.permit!
    params.fetch(:video, {})
  end
end
