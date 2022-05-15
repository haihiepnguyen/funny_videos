class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]
  before_action :set_my_video, only: %i[ edit update destroy ]

  # GET /videos or /videos.json
  def index
    @pagy, @videos = pagy(Video.all, items: 10)
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
end