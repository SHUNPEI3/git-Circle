class Admin::TopicCommentsController < ApplicationController

  def topic_comment_list
    @topic_comments = TopicComment.all
  end

  def update
    topic_comment = TopicComment.find(params[:id])
    topic_comment.update(is_active: false)
    redirect_to admin_community_topic_path(params[:community_id], params[:topic_id])
  end

  def destroy
    topic_comment = TopicComment.find(params[:id])
    topic_comment.destroy
    redirect_to admin_community_topic_path(params[:community_id], params[:topic_id])
  end

end
