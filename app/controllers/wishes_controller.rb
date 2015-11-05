class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :update, :destroy]

  # GET /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1.json
  def show
  end

  # POST /wishes.json
  def create
    @wish = Wish.new(wish_params)

    if @wish.save
      render :show, status: :created, location: @wish
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishes/1.json
  def update
    @user = User.find(@wish.user_id)
    if @user.id == request.headers["x-wishcastr-user-id"]
      if @user.amz_access_token == request.headers["x-wishcastr-access-token"]
        if @wish.update(wish_params)
          render :show, status: :ok, location: @wish
        else
          render json: @wish.errors, status: :unprocessable_entity
        end
      else
        render inline: {error: "Access Token does not match for user"}.to_json
      end
    else
      render inline: {error: "User does not own this wish"}.to_json
    end
  end

  # DELETE /wishes/1.json
  def destroy
    @wish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
      params.require(:wish).permit(:user_id, :threshold_price, :category, :query, :name)
    end

end
