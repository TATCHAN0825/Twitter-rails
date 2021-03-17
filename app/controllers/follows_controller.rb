class FollowsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :set_user

  def create
    if current_user.follow(@user)
      redirect_back fallback_location: root_path, notice: t('.created')
      @user.create_notification_follow!(@user)
    else
      redirect_back fallback_location: root_path, alert: t('.failed_create')
    end
  end

  def destroy
    if current_user.unfollow(@user)
      redirect_back fallback_location: root_path, notice: t('.destroyed')
    else
      redirect_back fallback_location: root_path, alert: t('.failed_destroy')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
