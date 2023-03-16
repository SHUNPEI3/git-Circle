class Public::BookmarksController < ApplicationController
  before_action :find_topic

  def create
    bookmark = current_end_user.bookmarks.new
    bookmark.topic_id = @topic.id
    bookmark.save
    render "bookmark"
  end

  def destroy
    bookmark = Bookmark.find_by(end_user_id: current_end_user.id, topic_id: @topic.id)
    bookmark.destroy
    render "bookmark"
  end

  private
    def find_topic
      @topic = Topic.find(params[:topic_id])
    end
end
