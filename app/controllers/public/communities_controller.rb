class Public::CommunitiesController < ApplicationController
  before_action :find_community, only: [:show, :edit, :update]

  def index
    @communities = Community.all.order(id: "DESC").page(params[:page]).per(4)  # 新着順で4件分取得
  end

  def new
    @community = Community.new
  end

  def create
    community = Community.create(community_params)
    community.owner_id = current_end_user.id
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
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction)
  end

  def find_community
    @community = Community.find(params[:id])
  end
end
