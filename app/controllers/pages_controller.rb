class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:search].present?
      if params[:search][:query] != "" && params[:search][:categories] == ""
        shops = Shop.search_by_name_and_address(params[:search][:query])
        @shops = shops.geocoded        
      elsif params[:search][:query] == "" && params[:search][:categories] != ""
        shops = Shop.search_by_category(params[:search][:categories])
        @shops = shops.geocoded
      elsif params[:search][:query] != "" && params[:search][:categories] != ""
        shops_categ = Shop.search_by_category(params[:search][:categories])
        shops = shops_categ.search_by_name_and_address(params[:search][:query])
        @shops = shops.geocoded
      elsif params[:search][:categories] == "" && params[:search][:query] == ""
        @shops = Shop.all.geocoded
      end
    else
      @shops = Shop.all.geocoded
    end
    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),
        image_url: helpers.asset_url('mid-blue-logo.png')
      }
    end
    render partial: 'shops/map', locals: { markers: @markers } if params[:search].present?
  end

  def dashboard
    @user = current_user
    @shops = Shop.where(user: current_user)
    @events = Event.joins(:shop).where("user_id = ?", @user.id)
    @favorite_events = FavoriteEvent.where("user_id = ?", @user.id)
    @qr = RQRCode::QRCode.new('dixpourcent')
    @page_marker="dashboard"
  end
end
