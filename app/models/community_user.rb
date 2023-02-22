class CommunityUser < ApplicationRecord

  belongs_to :end_user
  belongs_to :community

  def ensure_participation_conditions(community, community_detail, user)
    @community_id = community.id
    @community_detail = community_detail
    @user = user
    ensure_maximum_join_capacity
  end

  def ensure_maximum_join_capacity
    # コミュニティの人数制限が設定されていない or コミュニティの人数制限が設定 - 現在の登録数（レコード数）が１人以上であれば次へ
    if (@community_detail.max_join_number == nil) || ((@community_detail.max_join_number) - (CommunityUser.where(community_id: @community_id).count) >= 1)
      ensure_limit_of_sex
    end
  end

  def ensure_limit_of_sex
    # コミュニティの性別制限が設定されていない or コミュニティの性別制限が設定されているが、自分の性別と一致していれば次へ
    if (@community_detail.sex_limit == nil) || (@community_detail.sex_limit_before_type_cast == (@user.sex_before_type_cast - 1))
      ensure_limit_of_area
    end
  end

  def ensure_limit_of_area
    # コミュニティの活動エリア制限が設定されていない or コミュニティの活動エリア制限が設定されているが、自分の設定エリアと同じであれば次へ
    if (@community_detail.activity_area_limit) == nil || (@community_detail.activity_area_limit_before_type_cast == (@user.activity_area_before_type_cast - 1))
     ensure_limit_of_age
    end
  end

  def ensure_limit_of_age
    # コミュニティの年齢制限が設定されていなければそのまま加入
    if (@community_detail.age_min_limit == nil) && (@community_detail.age_max_limit == nil)
      self.save
    # コミュニティの年齢制限が設定されているが、自分の年齢が範囲内にふくまれていれば加入
    else
      @community_detail.age_min_limit = 0 if @community_detail.age_min_limit == nil
      @community_detail.age_max_limit = 101 if @community_detail.age_max_limit == nil
      if (@community_detail.age_min_limit..@community_detail.age_max_limit).to_a.include?(@user.age)
        self.save
      end
    end
  end

end
