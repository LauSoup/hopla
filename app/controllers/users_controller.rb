class UsersController < ApplicationController

  after_action :verify_authorized

  def show
    if params[:id] == "sign_out"
      sign_out current_user
      redirect_to root_path
    else
      @user = authorize User.find(params[:id])
    end
  end

  def edit
    @user = authorize current_user
  end

  def update
    @user = current_user
    @shops = Shop.all.select {|shop| shop.user_id == @user.id}
    authorize @user
    if @user.update(user_params)
      flash[:alert] = "Vos changements de paramètres ont été enregistrés."
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
