class ProductsWishesController < ApplicationController
  before_action :set_products_wish, only: [:show, :update, :destroy]

  # GET /products_wishes.json
  # def index
  #   @products_wishes = ProductsWish.all
  # end

  # GET /products_wishes/1.json
  def show
  end

  # POST /products_wishes.json
  def create
    @products_wish = ProductsWish.new(products_wish_params)

    if @products_wish.save
      render :show, status: :created, location: @products_wish
    else
      render inline: {error: @products_wish.errors}.to_json, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products_wishes/1.json
  def update
    if @products_wish.update(products_wish_params)
      render :show, status: :ok, location: @products_wish
    else
      render inline: {error: @products_wish.errors}.to_json, status: :unprocessable_entity
    end
  end

  # DELETE /products_wishes/1.json
  def destroy
    @products_wish.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products_wish
      @products_wish = ProductsWish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def products_wish_params
      params.require(:products_wish).permit(:wish_id, :product_id)
    end
end
