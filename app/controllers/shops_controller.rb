class ShopsController < ApplicationController

  def show
    @shop = Shop.find(params[:id])
  end
end
