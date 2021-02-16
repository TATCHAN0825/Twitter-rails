class UsersController < ApplicationController
  def show
    @user = User.find_by!(screen_name: params[:screen_name])
  end
end
