class Public::CommunityMessagesController < ApplicationController
  before_action :find_community

  def new
    @message_reply = @community.community_messages.new(parent_id: params[:parent_id])
      render 'reply'
  end

  def create
    @message = current_end_user.community_messages.new(community_message_params)
    @message.community_id = @community.id
    @message.save
    @message.messages_post_or_reply_notification(current_end_user, @community.id, @community.owner_id)
    render 'message'
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
