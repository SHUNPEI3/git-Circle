class Admin::TopicCommentsController < ApplicationController

  def top
    @topic_comments = TopicComment.all
  end

  def destroy
    topic_comment = TopicComment.find(params[:id])
    topic_comment.destroy
    redirect_to admin_community_topic_path(params[:community_id], params[:topic_id])
  end

  private

  def topic_comment_params
    params.require(:topic_comment).permit(:comment)
  end

end
