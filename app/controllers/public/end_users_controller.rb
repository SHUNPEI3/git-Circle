class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :find_end_user, except: [:index, :search_personal_tag]
  # before_action :ensure_guest_user, only: [:edit, :update]
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @tag_list = PersonalTag.all.order(id: "DESC").page params[:page]
    @end_users = EndUser.where(is_deleted: false).where.not(email: "guest@example.com").order(id: "DESC").page(params[:page])
  end

  def show
    @join_communities = @end_user.communities
    @history_communities = CommunityUser.where(end_user_id: @end_user.id).order(id: "DESC").limit(8)
    @topics = @end_user.topics.order(id: "DESC")
    @bookmarks = @end_user.bookmarks.order(id: "DESC")
  end

  def edit
    @tag_list = @end_user.personal_tags.pluck(:name).join(" ")
  end

  def update
    tag_list = params[:end_user][:personal_tag_name].split(nil)
    if @end_user.update(end_user_params)
      @end_user.save_tag(tag_list)
      redirect_to end_user_path(@end_user), notice: "更新に成功しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render "edit"
    end
  end

  def following
    @followings = @end_user.followings.page(params[:page])
  end

  def follower
    @followers = @end_user.followers.page(params[:page])
  end

  def unsubscribe
  end

  def withdraw
    @end_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
    def end_user_params
      params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :age, :sex, :activity_area, :introduction, :profile_image, :email)
    end

    def find_end_user
      @end_user = EndUser.find(params[:id])
    end

    # def ensure_guest_user
    #   if @end_user.guest_user?
    #     redirect_to end_user_path(current_end_user), alert: "ゲストユーザーはプロフィール編集画面へ遷移できません。""
    #   end
    # end

    def is_matching_login_user
      unless current_end_user.id == params[:id].to_i
        redirect_to end_user_path(current_end_user), alert: "他のユーザーはプロフィール編集画面へ遷移できません。"
      end
    end
end
