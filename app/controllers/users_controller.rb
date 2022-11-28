class UsersController < ApplicationController
  # before_action :set_user
  def profile
    @user = User.find(params[:id])
  end

  def users
    @users = User.all
  end

  def edit_role
    @user = User.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
