class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1.json
  def show
  end

  def amazon_login
    logger.debug(params)
    if params[:user][:amz_id].blank? || params[:user][:amz_access_token].blank?
      render inline: {error: "Must provide Amazon ID and Amazon Access Token", given: params}.to_json, status: :unprocessable_entity
    else
      begin
        @user = User.find_by(amz_id: params[:user][:amz_id])
        @user.update(amz_access_token: params[:user][:amz_access_token])
        render :show, status: :ok, location: @user
      rescue
        @user = User.create(
          amz_id: params[:user][:amz_id],
          name: params[:user][:name],
          email: params[:user][:email],
          provider: "Amazon",
          amz_access_token: params[:user][:access_token]
        )
        render :show, status: :created, location: @user
      end
    end
  end

  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :postal_code, :amz_id, :amz_access_token, :amz_raccess_token)
    end
end
