class Admin::CommunityMessagesController < ApplicationController
  def destroy
    message = CommunityMessage.find(params[:id])
    message.destroy
    redirect_to request.referer, notice: "メッセージを削除しました"
  end
end
