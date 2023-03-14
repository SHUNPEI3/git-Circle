class Admin::CommunityMessagesController < ApplicationController
  def destroy
    message = CommunityMessage.find(params[:id])
    message.destroy
    redirect_to request.referer
  end
end
