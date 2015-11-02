class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :update, :destroy]

  # GET /wishes
  # GET /wishes.json
  def index
    @wishes = Wish.all
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
  end

  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.new(wish_params)

    if @wish.save
      render :show, status: :created, location: @wish
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishes/1
  # PATCH/PUT /wishes/1.json
  def update
    if @wish.update(wish_params)
      render :show, status: :ok, location: @wish
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishes/1
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
      params.require(:wish).permit(:user_id, :threshold_price, :category)
    end
end
