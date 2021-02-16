class FollowsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :set_user

  def create
    if current_user.follow(@user)
      redirect_to user_path(@user), notice: t('.created')
    else
      redirect_to user_path(@user), alert: t('.failed_create')
    end
  end

  def destroy
    if current_user.unfollow(@user)
      redirect_to user_path(@user), notice: t('.destroyed')
    else
      redirect_to user_path(@user), alert: t('.failed_destroy')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
