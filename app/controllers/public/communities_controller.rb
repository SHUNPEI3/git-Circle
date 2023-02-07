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
    if community.save
      redirect_to communities_path
    else
      render new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to community_path
    else
      render edit
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :community_image, community_details_attributes: [:max_join_number, :sex_limit, :residence_limit, :_destroy, :id])
  end

  def find_community
    @community = Community.find(params[:id])
  end
end
