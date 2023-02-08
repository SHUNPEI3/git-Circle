class Public::CommunitiesController < ApplicationController
  before_action :find_community, only: [:show, :edit, :update]

  def index
    # order(id: "DESC")で、新規登録順に並び替え
    @communities = Community.all.order(id: "DESC").page(params[:page]).per(4)
  end

  def new
    @community = Community.new
    @community.community_details.build
  end

  def create
    community = Community.create(community_params)
    community.owner_id = current_end_user.id
    community.end_users << current_end_user

    # タグ情報をparamsで取得し、変数tag_listへ格納
    tag_list = params[:community][:community_tag_name].split(nil)

    # 年齢制限入力欄の確認用　※後でモデルに書く！
    ## if community.community_details.age_min_limit < community.community_details.age_max_limit ではだめ。。
    if params[:community][:community_details_attributes]["0"][:age_min_limit] <= params[:community][:community_details_attributes]["0"][:age_max_limit]
      if community.save
        community.save_tag(tag_list)
        redirect_to communities_path
      else
        render new
      end
    end
  end

  def show
    
  end

  def edit
    @tag_list = @community.tags.pluck(:name).join(' ')
  end

  def update
    tag_list = params[:community][:community_tag_name].split(nil)
    if @community.update(community_params)
      @community.save_tag(tag_list)
      redirect_to community_path
    else
      render edit
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :community_image, community_details_attributes: [:max_join_number, :sex_limit, :activity_area_limit, :age_min_limit, :age_max_limit, :_destroy, :id])
  end

  def find_community
    @community = Community.find(params[:id])
  end
end