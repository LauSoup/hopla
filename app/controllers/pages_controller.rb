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
end
