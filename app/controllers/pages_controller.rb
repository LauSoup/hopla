class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @shops = Shop.geocoded
    @markers = @shops.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end
  end

  def dashboard
    @user = current_user
    @shops = Shop.all.select{|shop| shop.user_id == @user.id}
    @events = Event.all.select{ |event| @shops.include?(event.shop) }
  end
end
