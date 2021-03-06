class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :update, :destroy]

  # GET /wishes.json
  def index
    user = User.find(params[:user_id])
    if user # && user.amz_access_token == params[:access_token]
      @wishes = user.wishes
    end
  end

  def draft
    user = User.find(params[:user_id])
    if user # && user.amz_access_token == params[:access_token]
      @wish = user.draft_wish
      if @wish
        render :show, status: :ok
      else
        @wish = Wish.create(user_id: user.id, name: params[:name])
        render :show, status: :created
      end
    else
      render inline: {error: "not authorized"}.to_json, status: :unauthorized
    end
  end

  def draft_wish_add
    user = User.find(params[:user_id])
    if user # && user.amz_access_token == params[:access_token]
      @wish = user.draft_wish
      products = params[:products]
      unless @wish
        @wish = Wish.create(user_id: user.id, name: params[:name])
      end
      products.each do |p|
        product = Product.find_or_create_by(sku: p[:sku], type: p[:type])
        PriceHistory.create(product_id: product.id, currency: "USD", price: p[:current_price], date: DateTime.now())
        product.update(description: p[:description], title: p[:title], image_large: p[:image_large])
        @wish.products << product unless @wish.product_duplicate?(product.sku, product.type)
      end
      render :show, status: :ok
    else
      render inline: {error: "Could not find user"}.to_json, status: :not_found
    end
  end


  # GET /wishes/1.json
  def show
    user = User.find(params[:user_id])
    if user #&& user.amz_access_token == params[:access_token]
      render :show, status: :ok
    end
  end

  # POST /wishes.json
  def create
    user = User.find(params[:user_id])
    if user # && user.amz_access_token == params[:access_token]
      @wish = Wish.new(wish_params)
      @wish.user_id = user.id
      if @wish.save
        render :show, status: :created, location: @wish
      else
        render inline: {error: @wish.errors}.to_json, status: :unprocessable_entity
      end
    else
      render inline: {error: "User ID or Access Token does not match"}.to_json, status: :forbidden
    end
  end

  # PATCH/PUT /wishes/1.json
  def update
    user = User.find(@wish.user_id)
    if user.id == params[:user_id].to_i
      # if user.amz_access_token == params[:access_token]
        if @wish.update(wish_params)
          @wish.update(saved: true)
          @wish.products.each do |p|
            next if params[:products].any? { |pp| p.sku == pp[:sku] && p.type == pp[:type] }
            ProductsWish.where(wish_id: @wish.id, product_id: p.id).each { |pw| pw.destroy }
          end
          render :show, status: :ok, location: @wish
        else
          render inline: {error: @wish.errors}.to_json, status: :unprocessable_entity
        end
      # else
        # render inline: {error: "Access Token does not match for user"}.to_json, status: :unauthorized
      # end
    else
      render inline: {error: "User does not own this wish", user_on_wish: @wish.user_id, provided: params[:user_id]}.to_json, status: :forbidden
    end
  end

  # DELETE /wishes/1.json
  def destroy
    user = User.find(params[:user_id])
    if user # && user.amz_access_token == params[:access_token]
      @wish.destroy
      render inline: {success: "Success"}.to_json, status: :ok
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
      params.require(:wish).permit(:id, :user_id, :threshold_price, :category, :query, :name, products: [:sku, :type, :image_large, :image_thumbnail, :title, :brand, :description, :affiliate_url])
    end

end
