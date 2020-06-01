require 'rqrcode'

class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update]

  def show
    authorize @shop
    @events = @shop.events.sort {|a,b| a.end_date <=> b.end_date}
    @qr = RQRCode::QRCode.new('dixpourcent')
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
      redirect_to shop_path(@shop)
    else
      render 'new'
    end

    # Creation of categories:
    create_tags
  end

  def edit
    authorize @shop
    @user = current_user
  end

  def update
    authorize @shop

    # Deletion of existing tags for this shop
    tags = Tag.where(shop_id: @shop.id)
    tags.each do |tag|
      tag.destroy
    end

    # Creation of updated categories
    create_tags

    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render 'edit'
    end
  end


  private

  def shop_params
    params.require(:shop).permit(:user_id, :description, :name, :address, :active, photos: [])
  end

  def set_shop
   @shop = Shop.find(params[:id])
  end

  def create_tags
    params[:shop][:category_ids].each do |category|
      if category != ""
        tag = Tag.new
        tag.category_id = category
        tag.shop_id = @shop.id
        tag.save
      end
    end
  end
end
