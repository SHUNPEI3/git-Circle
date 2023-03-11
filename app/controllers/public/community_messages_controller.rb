class Public::CommunityMessagesController < ApplicationController
  before_action :find_community

  def new
    @message_reply = @community.community_messages.new(parent_id: params[:parent_id])
  end

  def create
    @message = current_end_user.community_messages.new(community_message_params)
    @message.community_id = @community.id
    # @message_reply = @community.community_messages.new(community_message_params) #コメントに対する返信用の変数
    if @message.save
      render 'message'
      # @topic.comment_reply_notification(current_end_user, @topic_comment.id)
    end
  end

  def destroy
    @message = CommunityMessage.find(params[:id])
    @message.destroy
    render 'message'
  end

  private

  def community_message_params
    params.require(:community_message).permit(:message, :parent_id)
  end

  def find_community
    @community = Community.find(params[:community_id])
  end
end
