class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:follow, :unfollow]

  def follow
    current_user.follow(@user)
    NotificationService.notify(
      recipient: @user,
      actor: current_user,
      action: 'follow',
      notifiable: Follow.find_by(follower: current_user, followed: @user)
    )
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js
    end
  end

  def unfollow
    follow = Follow.find_by(follower: current_user, followed: @user)
    current_user.unfollow(@user)
    NotificationService.notify(
      recipient: @user,
      actor: current_user,
      action: 'unfollow',
      notifiable: follow
    )
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