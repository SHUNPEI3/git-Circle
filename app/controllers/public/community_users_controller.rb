class Public::CommunityUsersController < ApplicationController

  def create
    @community = Community.find(params[:community_id])
    @community_user = current_end_user.community_users.new(community_id: @community.id)
    @community_detail = CommunityDetail.find_by(community_id: @community.id)

    # 参加制限の照会
    ensure_maximum_join_capacity
  end

  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: community.id)
    if community_user.destroy
      redirect_to request.referer
    end
  end

  private

  def ensure_maximum_join_capacity
    # コミュニティの人数制限が設定されていない or コミュニティの人数制限が設定 - 現在の登録数（レコード数）が１人以上であれば次へ
    if (@community_detail.max_join_number == nil) || ((@community_detail.max_join_number) - (CommunityUser.where(community_id: @community.id).count) >= 1)
      ensure_limit_of_sex
    # それ以外の場合は加入できない
    else
      flash[:alert] = '参加上限数に達したため、加入ができません'
      redirect_to request.referer
    end
  end

  def ensure_limit_of_sex
    # コミュニティの性別制限が設定されていない or コミュニティの性別制限が設定されているが、自分の性別と一致していれば次へ
    if (@community_detail.sex_limit == nil) || (@community_detail.sex_limit_before_type_cast == (@current_end_user.sex_before_type_cast - 1))
      ensure_limit_of_area
    else
      flash[:alert] = '参加条件(性別）に一致していないため、加入ができません'
      redirect_to request.referer
    end
  end

  def ensure_limit_of_area
    # コミュニティの活動エリア制限が設定されていない or コミュニティの活動エリア制限が設定されているが、自分の設定エリアと同じであれば次へ
    if (@community_detail.activity_area_limit) == nil || (@community_detail.activity_area_limit_before_type_cast == (@current_end_user.activity_area_before_type_cast - 1))
     ensure_limit_of_age
    else
      flash[:alert] = '参加条件（活動エリア）に一致していないため、加入ができません'
      redirect_to request.referer
    end
  end

  def ensure_limit_of_age
    # コミュニティの年齢制限が設定されていなければそのまま加入
    if (@community_detail.age_min_limit == nil) && (@community_detail.age_max_limit == nil)
      @community_user.save
      redirect_to community_path(@community)
      community_invitation_notification_delete
    # コミュニティの年齢制限が設定されているが、自分の年齢が範囲内にふくまれていれば加入
    elsif (@community_detail.age_min_limit) || (@community_detail.age_max_limit)
      if @community_detail.age_min_limit == nil
        @community_detail.age_min_limit = 0
      elsif @community_detail.age_max_limit == nil
        @community_detail.age_max_limit = 101
      end
      if (@community_detail.age_min_limit..@community_detail.age_max_limit).to_a.include?(current_end_user.age)
        @community_user.save
      redirect_to community_path(@community)
      community_invitation_notification_delete
      else
        flash[:alert] = '参加条件（年齢）に一致していないため、加入ができません'
        redirect_to request.referer
      end
    else
      flash[:alert] = '参加条件（年齢）に一致していないため、加入ができません'
      redirect_to request.referer
    end
  end

  def community_invitation_notification_delete
    notification = Notification.find_by(visited_id: current_end_user.id, community_id: @community.id, action: "invitation")
    if notification
      notification.destroy
    end
  end

end
