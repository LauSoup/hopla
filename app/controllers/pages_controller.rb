class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      sql_query = " \
        shops.name ILIKE :query \
        OR shops.description ILIKE :query \ 
        OR shops.address ILIKE :query \
      "
      shops = Shop.where(sql_query, query: "%#{params[:query]}%" )
      @shops = shops.geocoded
    else  
      @shops = Shop.all.geocoded
    end
    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
      }
    end
  end

  def dashboard
    @user = current_user
    @shops = Shop.where(user: current_user)
    @events = Event.joins(:shop).where("user_id = ?", @user.id)
  end
end
