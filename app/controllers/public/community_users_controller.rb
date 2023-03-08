class Public::CommunityUsersController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    @community_detail = CommunityDetail.find_by(community_id: @community.id)
    @community_user = current_end_user.community_users.new(community_id: @community.id)
    # 参加制限の照会
    if @community_user.ensure_participation_conditions(@community, @community_detail, current_end_user)
      redirect_to community_path(@community), notice: 'コミュニティに参加しました！'
      community_invitation_notification_delete
      @community.community_join_notification(current_end_user, @community.id)
    else
      redirect_to request.referer, alert: '参加条件に一致していないため、加入ができません。参加条件をご確認ください。'
    end
  end

  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: community.id)
    community_user.destroy
    redirect_to request.referer, notice: 'コミュニティから退出しました'
  end

  private

  def community_invitation_notification_delete
    notification = Notification.find_by(visited_id: current_end_user.id, community_id: @community.id, action: "invitation")
    notification.destroy if notification
  end
end