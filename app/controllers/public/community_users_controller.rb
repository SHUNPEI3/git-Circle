class Public::CommunityUsersController < ApplicationController

  def create
    community = Community.find(params[:community_id])
    community_user = CommunityUser.new
    community_user.community_id = community.id
    community_user.end_user_id = current_end_user.id
    if community_user.save
      redirect_to communities_path
    end
  end

  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: community.id)
    if community_user.destroy
      redirect_to communities_path
    end
  end

end
