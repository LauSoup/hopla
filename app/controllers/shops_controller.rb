require 'rqrcode'

class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update]

  def show
    authorize @shop
    @events = @shop.events.sort {|a,b| a.end_date <=> b.end_date}
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
        flash[:alert] = "Votre nouveau magasin a été enregistré."
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
    if params[:shop][:name].present? && (params[:shop][:address].present? == false)
      # new event from dashboard (we get shop name but here we want to update only this shop (which has no address from our new form))
      redirect_to new_shop_event_path(params[:shop][:name])
    else
      authorize @shop
      # Deletion of existing tags for this shop
      tags = Tag.where(shop_id: @shop.id)
      tags.each do |tag|
        tag.destroy
      end
      # Creation of updated categories
      create_tags
      if @shop.update(shop_params)
        flash[:alert] = "Vos changements ont été enregistrés."
        redirect_to shop_path(@shop)
      else
        render 'edit'
      end
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
