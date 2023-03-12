class CommunityMessage < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  belongs_to :parent,  class_name: "CommunityMessage", optional: true
  has_many   :replies, class_name: "CommunityMessage", foreign_key: :parent_id, dependent: :destroy

  def messages_post_or_reply_notification(current_end_user, community_id, community_owner_id)
    #親メッセージがない（＝初めてのメッセージ）場合はコミュニティオーナーへ通知を送る
    unless self.parent_id.present?
      notification = current_end_user.active_notifications.new(visited_id: community_owner_id, community_id: community_id, action: 'messages_post')
      notification.save if notification.valid?
    else
      temp_ids = CommunityMessage.where(parent_id: parent_id).where.not(end_user_id: current_end_user.id).distinct.pluck(:end_user_id)
      # 子メッセージがない（＝返信がない）場合は、質問者に通知を送る
      if temp_ids.blank?
        notification = current_end_user.active_notifications.new(visited_id: parent.end_user_id, community_id: community_id, action: 'messages_reply')
        notification.save if notification.valid?
       # コメントされている場合は、回答者全員（質問に紐づいた）に通知を送る
      else
        temp_ids.each do |temp_id|
          notification = current_end_user.active_notifications.new(visited_id: temp_id, community_id: community_id,  action: 'messages_reply')
          if notification.visitor_id == notification.visited_id
            notification.checked = true
          end
          notification.save if notification.valid?
        end
      end
    end
  end
end