class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:follow, :unfollow]

  def follow
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def unfollow
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end 