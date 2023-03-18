class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_end_user, only: [:show, :edit, :update]

  def show
    @communities = @end_user.communities
    @topics = @end_user.topics.order(id: "DESC").limit(6)
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path(@end_user), notice: "更新に成功しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render edit
    end
  end

  private
    def find_end_user
      @end_user = EndUser.find(params[:id])
    end

    def end_user_params
      params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :age, :sex, :activity_area, :introduction, :profile_image, :email, :is_deleted)
    end
end
