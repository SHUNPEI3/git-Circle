class Public::EndUsersController < ApplicationController
  before_action :find_end_user, only:[:show, :edit, :update, :unsubscribe, :withdraw]

  def index
    @end_users = EndUser.all.order(id: "DESC").page(params[:page]).per(4)  # 新着順で4件分取得
  end

  def show
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user)
    else
      render edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def find_end_user
    @end_user = EndUser.find(params[:id])
  end

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :age, :sex, :activity_area, :introduction, :profile_image, :email)
  end
end
