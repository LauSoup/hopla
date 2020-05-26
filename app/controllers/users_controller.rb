class UsersController < ApplicationController

  after_action :verify_authorized

  def show
    @user = authorize User.find(params[:id])
  end

  def edit
    @user = authorize current_user
  end

  def update
    @user = current_user
    @shops = Shop.all.select {|shop| shop.user_id == @user.id}
    authorize @user
    if @user.update(user_params)
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
