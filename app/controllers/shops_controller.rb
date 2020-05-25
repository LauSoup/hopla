class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]

  def show
  end

  def new
    @shop = Shop.new
    authorize @shop
    @user = current_user
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user = current_user
    authorize @shop
    if @shop.save
      redirect_to shops_path(:id)
    else
      render 'new'
    end
  end

  def edit
    authorize @shop
    @user = current_user
  end

  def update
    authorize @shop
    if @shop.update(shop_params)
      redirect_to shops_path(current_user)
    else
      render 'edit'
    end
  end


  private

  def shop_params
    params.require(:shop).permit(:user_id, :description, :name, :photo, :address, :active)
  end

  def set_shop
  @shop = Shop.find(params[:id])
  end
end
