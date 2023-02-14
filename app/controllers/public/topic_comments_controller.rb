class Public::TopicCommentsController < ApplicationController

  def create
    @community = Community.find(params[:community_id])
    @topic = Topic.find(params[:topic_id])
    @topic_comment = current_end_user.topic_comments.new(topic_comment_params)
    @topic_comment.community_id = @community.id
    @topic_comment.topic_id = @topic.id
    if @topic_comment.save
      flash[:notice] = "投稿完了しました！"
      render 'topic_comment'
    else
      flash[:alert] = "投稿に失敗しました"
      render 'topic_comment'
    end
  end

  def destroy
    @topic_comment = TopicComment.find(params[:id])
    @topic_comment.destroy
    render 'topic_comment'
  end

  private

  def topic_comment_params
    params.require(:topic_comment).permit(:comment)
  end
end
