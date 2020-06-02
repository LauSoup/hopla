class FavoriteEventsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @favorite_event = FavoriteEvent.new()
    @favorite_event.user = current_user
    @favorite_event.event = @event
    authorize @favorite_event
    @favorite_event.save
    redirect_to shop_path(@event.shop)
  end

  def destroy
    @favorite_event = FavoriteEvent.find(params[:id])
    authorize @favorite_event
    @favorite_event.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to shop_path(@event.shop)
  end
end
