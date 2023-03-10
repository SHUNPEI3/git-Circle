class Public::HomesController < ApplicationController
  def top
    @end_user = EndUser.new
    @new_communities = Community.all.order(created_at: :desc).take(6)
    @new_topic_community = Community.lasted_post_community_get.take(6)
  end

  def about
  end
end