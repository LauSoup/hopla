class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def show
    authorize @event
  end

  def new
    @event = Event.new
    # authorize @event
    @user = current_user
    @shop = Shop.find(params[:shop_id])
    authorize @shop
  end

  def create
    @event = Event.new(event_params)
    @shop = Shop.find(params[:shop_id])
    @user = current_user
    @event.shop_id = @shop.id
    authorize @event
    if @event.save
      @event.qr_code = event_path(:id)
      @event.save
      redirect_to shop_path(@shop)
    else
      render 'new'
    end
  end

  def edit
    authorize @event
    @user = current_user
    @shop = Shop.find(params[:shop_id])
  end

  def update
    authorize @event
    @user = current_user

    @shop = Shop.find(params[:shop_id])
    if @event.update(event_params)
      redirect_to shop_path(@shop)
    else
      render 'edit'
    end
  end


  private

  def event_params
    params.require(:event).permit(:shop_id, :description, :title, :beg_date, :end_date, :offer, :category, :active, photos: [])
  end

  def set_event
   @event = Event.find(params[:id])
  end

end
