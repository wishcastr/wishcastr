class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products.json
  def index
    @products = Product.all
  end

  def top
    quantity = params[:limit] || 25
    @products = Product.by_wishes(quantity)
    render :index
  end

  # GET /products/1.json
  def show
  end

  def search
    results = []
    params[:query].split(" ").each do |w|
      q = "%#{w}%"
      results += Product.where("title LIKE ?", q)
    end
    @products = results.uniq
    render :index
  end

  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render :show, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      render :show, status: :ok, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:type, :sku, :image_large, :image_thumbnail, :title, :brand, :description, :affiliate_url, :limit)
    end
end
