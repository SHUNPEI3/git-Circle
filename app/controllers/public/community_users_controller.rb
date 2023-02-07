class Public::CommunityUsersController < ApplicationController

  def create
    community = Community.find(params[:community_id])
    community_user = current_end_user.community_users.new(community_id: community.id)


    community_detail = CommunityDetail.find_by(community_id: community.id)

    # #参加制限の照会
    # ## コミュニティの人数制限が設定されていなければそのまま加入
    if community_detail.max_join_number == nil
      if community_detail.sex_limit == nil
        if community_detail.activity_area_limit == nil
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        elsif community_detail.activity_area_limit_before_type_cast == (current_end_user.activity_area_before_type_cast - 1)
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        end
      elsif community_detail.sex_limit_before_type_cast == (current_end_user.sex_before_type_cast - 1)
        if community_detail.activity_area_limit == nil
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
          community_user.save
          redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        elsif community_detail.activity_area_limit_before_type_cast == (current_end_user.activity_area_before_type_cast - 1)
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        end
      end
    # ## コミュニティの人数制限が設定 - 現在の登録数（レコード数）が１人以上であれば加入
    elsif (community_detail.max_join_number) - (CommunityUser.where(community_id: community.id).count) >= 1
      if community_detail.sex_limit == nil
        if community_detail.activity_area_limit == nil
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        elsif community_detail.activity_area_limit_before_type_cast == (current_end_user.activity_area_before_type_cast - 1)
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        end
      elsif community_detail.sex_limit_before_type_cast == (current_end_user.sex_before_type_cast - 1)
        if community_detail.activity_area_limit == nil
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        elsif community_detail.activity_area_limit_before_type_cast == (current_end_user.activity_area_before_type_cast - 1)
          if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
            community_user.save
            redirect_to request.referer
          elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
            if community_detail.age_min_limit == nil
              community_detail.age_min_limit = 0
            elsif community_detail.age_max_limit == nil
              community_detail.age_max_limit = 101
            end
            if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
              community_user.save
              redirect_to request.referer
            end
          end
        end
      end
    # ## それ以外の場合は加入できない
    else
      flash[:notice] = '参加条件に一致していないため、加入ができません'
      redirect_to request.referer
    end

    # ## コミュニティの性別制限が設定されていなければそのまま加入
    # if community_detail.sex_limit == nil
    #   community_user.save
    #   redirect_to request.referer
    # elsif community_detail.sex_limit_before_type_cast == (current_end_user.sex_before_type_cast - 1)
    #   community_user.save
    #   redirect_to request.referer
    # else
    #   flash[:notice] = '参加条件に一致していないため、加入ができません'
    #   redirect_to request.referer
    # end

    ## コミュニティの活動エリア制限が設定されていなければそのまま加入
    # if community_detail.activity_area_limit == nil
    #   community_user.save
    #   redirect_to request.referer
    # elsif community_detail.activity_area_limit_before_type_cast == (current_end_user.activity_area_before_type_cast - 1)
    #   community_user.save
    #   redirect_to request.referer
    # else
    #   flash[:notice] = '参加条件に一致していないため、加入ができません'
    #   redirect_to request.referer
    # end

    # ## コミュニティの年齢制限が設定されていなければそのまま加入
    # if (community_detail.age_min_limit == nil) && (community_detail.age_max_limit == nil)
    #   community_user.save
    #   redirect_to request.referer
    # elsif (community_detail.age_min_limit) || (community_detail.age_max_limit)
    #   if community_detail.age_min_limit == nil
    #     community_detail.age_min_limit = 0
    #   elsif community_detail.age_max_limit == nil
    #     community_detail.age_max_limit = 101
    #   end

    #   if (community_detail.age_min_limit..community_detail.age_max_limit).to_a.include?(current_end_user.age)
    #     community_user.save
    #     redirect_to request.referer
    #   end
    # else
    #   flash[:notice] = '参加条件に一致していないため、加入ができません'
    #   redirect_to request.referer
    # end

  end

  def destroy
    community = Community.find(params[:community_id])
    community_user = CommunityUser.find_by(end_user_id: current_end_user.id, community_id: community.id)
    if community_user.destroy
      redirect_to request.referer
    end
  end

end
