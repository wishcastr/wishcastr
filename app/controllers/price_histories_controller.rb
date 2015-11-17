class PriceHistoriesController < ApplicationController
  before_action :set_price_history, only: [:show, :update, :destroy]

  # GET /price_histories.json
  # def index
  #   @price_histories = PriceHistory.all
  # end

  # GET /price_histories/1.json
  def show
  end

  # POST /price_histories.json
  def create
    @price_history = PriceHistory.new(price_history_params)

    if @price_history.save
      render :show, status: :created, location: @price_history
    else
      render inline: {error: @price_history.errors}.to_json, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /price_histories/1.json
  def update
    if @price_history.update(price_history_params)
      render :show, status: :ok, location: @price_history
    else
      render inline: {error: @price_history.errors}.to_json, status: :unprocessable_entity
    end
  end

  # DELETE /price_histories/1.json
  def destroy
    @price_history.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_history
      @price_history = PriceHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_history_params
      params.require(:price_history).permit(:product_id, :currency, :price, :date)
    end
end
