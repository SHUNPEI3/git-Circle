class Public::CommunityMessagesController < ApplicationController
  before_action :find_community

  def create
    @message = current_end_user.community_messages.new(community_message_params)
    @message.community_id = @community.id
    if @message.save
      render 'message'
      # @topic.comment_reply_notification(current_end_user, @topic_comment.id)
    else
      render 'message'
    end
  end

  def destroy
    @message = CommunityMessage.find(params[:id])
    @message.destroy
    render 'message'
  end

  private

  def community_message_params
    params.require(:community_message).permit(:message)
  end

  def find_community
    @community = Community.find(params[:community_id]) #form_withには親のインスタンス変数を渡す必要がある
  end
end
