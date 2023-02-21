class Public::HomesController < ApplicationController
  def top
    @end_user = EndUser.new
    @community_ranks = Community.find(CommunityUser.group(:community_id).order('count(community_id) desc').limit(3).pluck(:community_id))
    @community_news = Community.all.order(created_at: :desc).limit(3)
  end

  def about
  end
end