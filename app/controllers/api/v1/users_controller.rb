class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render json: { user: @user }, status: :ok
    # render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 201, message: 'user created successfully!', content: { user: @user } }
      # render json: @user, status: :created, location: @user
    else
      render json: { error: 401, message: ' user cannot be processed !' }
      # render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    if @user.destroy!
      render json: { success: 'The user has been deleted successfully' }, status: :ok
    else
      render json: { error: 'There was an error, please try again!' }, status: :internal_server_error
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:fullname, :username, :email, :password_digest)
  end
end
