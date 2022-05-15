class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy_session
    return unless current_user.present?

    sign_out_and_redirect(current_user)
  end

  private
    def set_user
      # sign_out current_user
      @user = User.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :name)
    end
end
