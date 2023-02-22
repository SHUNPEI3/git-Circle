class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :find_end_user, except: [:index, :search_personal_tag]
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit, :update]

  def index
    # whereメソッドで退会ではないユーザーを取得 + order(id: "DESC")で、新規登録順に並び替え
    @tag_list = PersonalTag.all.order(id: "DESC").limit(10)
    @end_users = EndUser.where(is_deleted: false).order(id: "DESC").page(params[:page]).per(8)
  end

  def show
    @community_users = @end_user.community_users.order(id: "DESC").limit(10)
    @owner_communities = Community.where(owner_id: @end_user.id)
    @topics = @end_user.topics.order(id: "DESC").limit(6)
  end

  def edit
    @tag_list = @end_user.personal_tags.pluck(:name).join(' ')
  end

  def update
    tag_list = params[:end_user][:personal_tag_name].split(nil)
    if @end_user.update(end_user_params)
      @end_user.save_tag(tag_list)
      flash[:notice] = "更新に成功しました"
      redirect_to end_user_path(@end_user)
    else
      flash.now[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end

  def following
    @followings = @end_user.followings.page(params[:page]).per(10)
  end

  def follower
    @followers = @end_user.followers.page(params[:page]).per(10)
  end

  def bookmark
    @bookmarks = @end_user.bookmarks.page(params[:page]).per(10)
  end

  def my_community
    @join_communities = @end_user.communities.page(params[:join]).per(10)
    @owner_communities = Community.where(owner_id: @end_user.id).page(params[:owner]).per(10)
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

  def ensure_guest_user
    if @end_user.last_name == "guest" && @end_user.first_name == "user" && @end_user.nickname == "ゲストユーザー"
      redirect_to end_user_path(current_end_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def is_matching_login_user
    unless current_end_user.id == params[:id].to_i
     redirect_to end_user_path(current_end_user), notice: '他のユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :age, :sex, :activity_area, :introduction, :profile_image, :email)
  end
end
