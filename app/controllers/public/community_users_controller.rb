class Public::CommunityUsersController < ApplicationController

  def create
    @community = Community.find(params[:community_id])
    @community_detail = CommunityDetail.find_by(community_id: @community.id)
    @community_user = current_end_user.community_users.new(community_id: @community.id)

    # 参加制限の照会
    if @community_user.ensure_participation_conditions(@community, @community_detail, current_end_user)
      flash[:notice] = 'コミュニティに参加しました！'
      redirect_to community_path(@community)
      community_invitation_notification_delete
    else
      flash[:alert] = '参加条件に一致していないため、加入ができません。参加条件をご確認ください。'
      redirect_to request.referer
    end
  end

  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: community.id)
    if community_user.destroy
      flash[:notice] = 'コミュニティから退出しました'
      redirect_to request.referer
    end
  end

  private

  def community_invitation_notification_delete
    notification = Notification.find_by(visited_id: current_end_user.id, community_id: @community.id, action: "invitation")
    if notification
      notification.destroy
    end
  end

end
