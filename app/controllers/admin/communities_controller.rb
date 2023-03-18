class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_community, except: [:index]

  def index
    @communities = Community.all.order(id: "DESC").page(params[:page]).per(20)
  end

  def show
    @topics = @community.topics.order(id: "DESC").limit(10)
  end

  def edit
    @tag_list = @community.tags.pluck(:name).join(" ")
  end

  def update
    tag_list = params[:community][:community_tag_name].split(nil)
    if (params[:community][:community_detail_attributes][:age_max_limit] == "") || (params[:community][:community_detail_attributes][:age_min_limit] <= params[:community][:community_detail_attributes][:age_max_limit])
      if @community.update(community_params)
        @community.save_tag(tag_list)
        redirect_to admin_community_path, notice: "更新完了しました！"
      else
        flash.now[:alert] = "更新に失敗しました"
        render "edit"
      end
    else
      flash.now[:alert] = "最少年齢設定が最大年齢設定を上回っています"
      render "edit"
    end
  end

  def destroy
    @community.destroy
    redirect_to admin_communities_path, notice: "削除が完了しました！"
  end

  def member
    @members = CommunityUser.where(community_id: @community.id)
  end

  def question
  end

  private
    def community_params
      params.require(:community).permit(:name, :introduction, :community_image, community_detail_attributes: [:max_join_number, :sex_limit, :activity_area_limit, :age_min_limit, :age_max_limit, :recruiting_status, :_destroy, :id])
    end

    def find_community
      @community = Community.find(params[:id])
    end
end
