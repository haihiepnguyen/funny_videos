class VideosController < ApplicationController
  # before_action :redirect_to_login, except: %i[index]
  before_action :set_video, only: %i[ show edit update destroy ]
  before_action :set_my_video, only: %i[ edit update destroy ]

  # GET /videos or /videos.json
  def index
    @pagy, @videos = pagy(
      Video.all.order(created_at: :desc),
      items: 10
    )
    @user_reacts = UserReact.where(user: current_user, video_id: @videos.pluck(:id))
  end

  # GET /videos/1 or /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create
    @video = current_user.videos.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to video_url(@video), notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @my_video.update(video_params)
        format.html { redirect_to video_url(@my_video), notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @my_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @my_video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    ReactVideoJob.perform_now(current_user.id, params[:id], "like")
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Liked." }
      format.html { }
    end
  end

  def dislike
    ReactVideoJob.perform_now(current_user.id, params[:id], "dislike")
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Disliked." }
      format.json { render json: { code: 0, status: "success" } }
    end
  end

  def undo_react
    user_react = UserReact.find_by(user_id: current_user.id, video_id: params[:id])
    json_response = { code: 0, status: "success" }
    if user_react.present?
      user_react.destroy
    else
      json_response = { code: 1, status: "failure", message: "cannot find react" }
    end
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Undo." }
      format.json { render json: json_response }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_my_video
      @my_video = current_user.videos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:url, :status)
    end

  def redirect_to_login
    redirect_to new_user_session_path unless current_user.present?
  end
end
