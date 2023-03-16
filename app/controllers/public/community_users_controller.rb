class Public::CommunityUsersController < ApplicationController
  before_action :find_community

  def create
    @community_detail = CommunityDetail.find_by(community_id: @community.id)
    @community_user = current_end_user.community_users.new(community_id: @community.id)
    # 参加制限の照会
    if @community_user.ensure_participation_conditions(@community, @community_detail, current_end_user)
      community_invitation_notification_delete
      @community.community_join_notification(current_end_user)
      flash.now[:notice] = 'コミュニティに参加しました！'
      render 'join_or_exit'
    else
      flash.now[:alert] = '参加条件に一致していないため、加入ができません。参加条件をご確認ください。'
      render 'join_or_exit'
    end
  end

  def destroy
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: @community.id)
    community_user.destroy
    flash.now[:notice] = 'コミュニティから退出しました！'
    render 'join_or_exit'
  end

  def evict
    @members = CommunityUser.where(community_id: @community.id)
    community_user = CommunityUser.find_by(end_user_id: params[:user_id], community_id: @community.id)
    community_user.destroy
    flash.now[:notice] = 'コミュニティから退出させました。'
    render 'evict'
  end

  private

  def find_community
    @community = Community.find(params[:community_id])
  end

  def community_invitation_notification_delete
    notification = Notification.find_by(visited_id: current_end_user.id, community_id: @community.id, action: "invitation")
    notification.destroy if notification
  end
end