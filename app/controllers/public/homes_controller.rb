class Public::HomesController < ApplicationController
  def top
    @end_user = EndUser.new
    @new_communities = Community.all.order(created_at: :desc).limit(6)
    @new_topic_community = Community.find(Topic.group(:community_id).order(created_at: :desc).limit(6).pluck(:community_id))
  end

  def about
  end
end