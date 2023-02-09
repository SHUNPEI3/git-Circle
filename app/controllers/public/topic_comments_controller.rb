class Public::TopicCommentsController < ApplicationController

  def create
    community = Community.find(params[:community_id])
    topic = Topic.find(params[:topic_id])
    topic_comment = current_end_user.topic_comments.new(topic_comment_params)
    topic_comment.community_id = community.id
    topic_comment.topic_id = topic.id
    if topic_comment.save
      redirect_to community_topic_path(topic.community, topic)
    end
  end

  def destroy
    topic_comment = TopicComment.find(params[:id])
    topic_comment.destroy
    redirect_to community_topic_path(params[:community_id], params[:topic_id])
  end

  private

  def topic_comment_params
    params.require(:topic_comment).permit(:comment)
  end
end
