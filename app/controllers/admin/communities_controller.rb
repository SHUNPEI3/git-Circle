class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_community, only: [:show, :edit, :update, :destroy]

  def index
    @communities = Community.all.order(id: "DESC").page(params[:page]).per(20)
  end

  def show
    @topics = @community.topics.order(id: "DESC").limit(10)
  end

  def edit
    @tag_list = @community.tags.pluck(:name).join(' ')
  end

  def update
    tag_list = params[:community][:community_tag_name].split(nil)
    if @community.update(community_params)
      @community.save_tag(tag_list)
      redirect_to admin_community_path
    else
      render edit
    end
  end

  def destroy
    @community.destroy
    redirect_to admin_communities_path
  end

  private

  def community_params
    params.require(:community).permit(:name, :introduction, :community_image, community_details_attributes: [:max_join_number, :sex_limit, :activity_area_limit, :age_min_limit, :age_max_limit, :_destroy, :id])
  end

  def find_community
    @community = Community.find(params[:id])
  end
end
