class Public::TopicCommentsController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    @topic = Topic.find(params[:topic_id])
    @topic_comment = current_end_user.topic_comments.new(topic_comment_params)
    @topic_comment.community_id = @community.id
    @topic_comment.topic_id = @topic.id
    @topic_comment.save
    flash.now[:notice] = 'コメントを投稿しました。'
    render 'topic_comment'
    @topic.comment_reply_notification(current_end_user, @topic_comment.id)
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @topic_comment = TopicComment.find(params[:id])
    @topic_comment.destroy
    flash.now[:notice] = 'コメントを削除しました。'
    render 'topic_comment'
  end

  private

  def topic_comment_params
    params.require(:topic_comment).permit(:comment)
  end
end
