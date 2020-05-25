class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update]

  def new
    @event = Event.new
    authorize @event
    @user = current_user
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      redirect_to shop_path(:shop_id)
    else
      render 'new'
    end
  end

  def edit
    authorize @event
    @user = current_user
  end

  def update
    authorize @event
    if @event.update(event_params)
      redirect_to shop_path(:shop_id)
    else
      render 'edit'
    end
  end


  private

  def event_params
    params.require(:event).permit(:shop_id, :description, :title, :photo, :beg_date, :end_date, :offer, :category, :qr_code)
  end

  def set_event
   @event = Event.find(params[:id])
  end
end
