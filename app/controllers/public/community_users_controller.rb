class Public::CommunityUsersController < ApplicationController

  def create
    community = Community.find(params[:community_id])
    community_user = current_end_user.community_users.new(community_id: community.id)
    if community_user.save
      redirect_to request.referer
    end
  end

  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: community.id)
    if community_user.destroy
      redirect_to request.referer
    end
  end

end
