class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:search].present?
      if params[:search][:query] != "" && params[:search][:categories] == ""
        shops = Shop.search_by_name_and_address(params[:search][:query]).where(active: true)
        @shops = shops.geocoded
      elsif params[:search][:query] == "" && params[:search][:categories] != ""
        shops = Shop.search_by_category(params[:search][:categories]).where(active: true)
        @shops = shops.geocoded
      elsif params[:search][:query] != "" && params[:search][:categories] != ""
        shops_categ = Shop.search_by_category(params[:search][:categories]).where(active: true)
        shops = shops_categ.search_by_name_and_address(params[:search][:query])
        @shops = shops.geocoded
      elsif params[:search][:categories] == "" && params[:search][:query] == ""
        @shops = Shop.all.where(active: true).geocoded
      end
    else
      @shops = Shop.all.where(active: true).geocoded
    end
    @markers = @shops.map do |shop|
      if shop.events.count == 0
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),
        image_url: helpers.asset_url('mid-blue-logo.png')
      }
      else
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop }),
        image_url: helpers.asset_url('orange-logo.png')
      }
      end
    end
    render partial: 'shops/map', locals: { markers: @markers } if params[:search].present?
  end

  def dashboard
    @user = current_user
    @shops = Shop.where(user: current_user)
    @events = Event.joins(:shop).where("user_id = ?", @user.id).sort {|a,b| a.end_date <=> b.end_date}
    @favorite_events = FavoriteEvent.where("user_id = ?", @user.id)
    @page_marker="dashboard"
  end

  def events
    @user = current_user
    @shops = Shop.where(user: current_user)
    @events = Event.joins(:shop).where("user_id = ?", @user.id).sort {|a,b| a.end_date <=> b.end_date}
    @favorite_events = FavoriteEvent.where("user_id = ?", @user.id)
    @page_marker="events"
  end
end
