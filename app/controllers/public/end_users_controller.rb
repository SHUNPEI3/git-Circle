class Public::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
