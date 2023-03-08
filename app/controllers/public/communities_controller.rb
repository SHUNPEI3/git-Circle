class Public::CommunitiesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :find_community, only: [:show, :edit, :update]
  before_action :is_matching_community_owner, only: [:edit, :update]

  def index
    @communities = Community.all.order(id: "DESC").page(params[:page]).per(8)
    @category_list = Category.all
    @tag_list = Tag.all.order(id: "DESC").page params[:page]
  end

  def new
    @community = Community.new
    @community.community_details.build
  end

  def create
    @community = Community.new(community_params)
    @community.owner_id = current_end_user.id
    @community.end_users << current_end_user
    # Language APIで取得した情報を、変数category_nameへ格納
    category_name = Language.get_category(community_params[:name])
    # タグ情報をparamsで取得し、変数tag_listへ格納
    tag_list = params[:community][:community_tag_name].split(nil)
    # 年齢制限入力欄の確認
    if (params[:community][:community_details_attributes]["0"][:age_max_limit] == "") || (params[:community][:community_details_attributes]["0"][:age_min_limit] <= params[:community][:community_details_attributes]["0"][:age_max_limit])
      if @community.save
        @community.save_category(category_name)
        @community.save_tag(tag_list)
        redirect_to communities_path, notice: "作成が完了しました！"
      else
        flash.now[:alert] = "作成に失敗しました"
        render "new"
      end
    else
      flash.now[:alert] = "最少年齢設定が最大年齢設定を上回っています"
      render 'new'
    end
  end

  def show
    @topics = @community.topics.order(id: "DESC").limit(6)
    @other_users = current_end_user.followings
  end

  def edit
    @tag_list = @community.tags.pluck(:name).join(' ')
  end

  def update
    category_name =  Language.get_category(community_params[:name])
    tag_list = params[:community][:community_tag_name].split(nil)
    if (params[:community][:community_details_attributes]["0"][:age_max_limit] == "") || (params[:community][:community_details_attributes]["0"][:age_min_limit] <= params[:community][:community_details_attributes]["0"][:age_max_limit])
      if @community.update(community_params)
        @community.save_category(category_name)
        @community.save_tag(tag_list)
        redirect_to community_path, notice: "更新完了しました！"
      else
        flash.now[:alert] = "更新に失敗しました"
        render 'edit'
      end
    else
      flash.now[:alert] = "最少年齢設定が最大年齢設定を上回っています"
      render 'edit'
    end
  end

  def invitation
    @community = Community.find(params[:community_id])
    @user = EndUser.find_by(id: params[:community][:user_id])
    if @user
      if @community.community_invitation_notification(current_end_user, @user.id, @community.id)
        redirect_to request.referer, notice: "招待を送りました！！"
      else
        redirect_to request.referer, alert: "すでに招待しています。"
      end
    else
      redirect_to request.referer, alert: "招待者が選択されていません。"
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :community_image, community_details_attributes: [:max_join_number, :sex_limit, :activity_area_limit, :age_min_limit, :age_max_limit, :_destroy, :id])
  end

  def find_community
    @community = Community.find(params[:id])
  end

  def is_matching_community_owner
    @community = Community.find(params[:id])
    unless @community.owner == current_end_user
     redirect_to end_user_path(current_end_user), alert: '作成者以外はコミュニティ編集画面へ遷移できません。'
    end
  end
end