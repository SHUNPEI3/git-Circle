class Public::GoodsController < ApplicationController
  before_action :find_topic

  def create
    good = current_end_user.goods.new
    good.topic_comment_id = @topic_comment.id
    good.save
    render 'replace_btn'
  end
  def destroy
    good = Good.find_by(end_user_id: current_end_user.id, topic_comment_id: @topic_comment.id)
    good.destroy
    render 'replace_btn'
  end

  private

  def find_topic
    @topic_comment = TopicComment.find(params[:topic_comment_id])
  end

end
