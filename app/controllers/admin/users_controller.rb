class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    @reviews = Review.all
  end

  def destroy
    user_id = params[:id]
    @user = User.find(user_id)
    @reviews = @user.reviews
    @reviews.delete_all
    @user.delete
    redirect_to admin_users_path, notice: "You have successfully deleted a user and their reviews"
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @reviews = @user.reviews
    @venues = @user.venues

    render :show
  end

end
