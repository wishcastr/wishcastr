class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :update, :destroy]

  # GET /wishes.json
  def index
    user = User.find(request.headers["x-wishcastr-user-id"])
    if user && user.amz_access_token == request.headers["x-wishcastr-access-token"]
      @wishes = user.wishes
    end
  end

  def draft
    user = User.find(request.headers["x-wishcastr-user-id"])
    if user && user.amz_access_token == request.headers["x-wishcastr-access-token"]
      @wish = user.draft_wish
        if @wish
          render :show, status: :success
        else
          @wish.create(user_id: user.id)
          if @wish.save
            render :show, status: :created
          else
            render json: @wish.errors, status: :unprocessable_entity
          end
        end
    end
  end

  def draft_wish_add
    user = User.find(request.headers["x-wishcastr-user-id"])
    if user && user.amz_access_token == request.headers["x-wishcastr-access-token"]
      @wish = user.draft_wish
      product = params[:product]
      if @wish
        @wish.products << product unless @wish.product_duplicate?(product.sku, product.type)
        render :show, status: :success
      else
        @wish.new(user_id: user.id)
        @wish.products << product
        if @wish.save
          render :show, status: :created
        else
          render json: @wish.errors
        end
      end
    end
  end
  # GET /wishes/1.json
  def show
    user = User.find(request.headers["x-wishcastr-user-id"])
    if user && user.amz_access_token == request.headers["x-wishcastr-access-token"]
      render :show, status: :success
    end
  end

  # POST /wishes.json
  def create
    user = User.find(request.headers["x-wishcastr-user-id"])
    if user && user.amz_access_token == request.headers["x-wishcastr-access-token"]
      @wish = Wish.new(wish_params)
      @wish.user_id = user.id
      if @wish.save
        render :show, status: :created, location: @wish
      else
        render json: @wish.errors, status: :unprocessable_entity
      end
    else
      render inline: {error: "User ID or Access Token does not match"}.to_json, status: :forbidden
    end
  end

  # PATCH/PUT /wishes/1.json
  def update
    user = User.find(@wish.user_id)
    if user.id == request.headers["x-wishcastr-user-id"]
      if user.amz_access_token == request.headers["x-wishcastr-access-token"]
        if @wish.update(wish_params)
          render :show, status: :ok, location: @wish
        else
          render json: @wish.errors, status: :unprocessable_entity
        end
      else
        render inline: {error: "Access Token does not match for user"}.to_json, status: :unauthorized
      end
    else
      render inline: {error: "User does not own this wish"}.to_json, status: :forbidden
    end
  end

  # DELETE /wishes/1.json
  def destroy
    user = User.find(request.headers["x-wishcastr-user-id"])
    if user && user.amz_access_token == request.headers["x-wishcastr-access-token"]
      @wish.destroy
      render inline: {success: "Success"}.to_json, status: :success
    else
      render inline: {error: "Page not found"}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      begin
        @wish = Wish.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render inline: {notice: "Can't be found"}.to_json, status: :not_found
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
      params.require(:wish).permit(:user_id, :threshold_price, :category, :query, :name,
      {product: [:type, :sku, :image_large, :image_thumbnail, :title, :brand, :description, :affiliate_url]})
    end

end
