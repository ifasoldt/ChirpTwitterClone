class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    # Reject the current_user (note: use SQL, not actual reject)
    @users = User.order(:name).where.not(id: current_user.id)

    render json: @users, each_serializer: UserIndexSerializer
  end

  # GET /users/1
  def show
    render json: @user
  end


  def login
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        render json: @user, serializer: CurrentUserSerializer
      else
        @error = {error: "Email and/or password does not exist, please try again"}
        render json: @error, status: 403
      end
    else
      @error = {error: "Email and/or password does not exist, please try again"}
      render json: @error, status: 403
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: CurrentUserSerializer, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
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
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :password, :email, :picture_url)
    end
end
