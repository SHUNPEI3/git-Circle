class Admin::CommunityUsersController < ApplicationController
  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: params[:user_id], community_id: community.id)
    community_user.destroy
    redirect_to request.referer, notice: 'コミュニティから退出させました'
  end
end
