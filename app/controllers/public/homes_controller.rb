class Public::HomesController < ApplicationController
  def top
    @end_user = EndUser.new
    @new_communities = Community.open_community_get.order(created_at: :desc).take(6)
    @new_topic_community = Community.find(Topic.order(created_at: :desc).pluck(:community_id)).take(6)
  end

  def about
  end
end