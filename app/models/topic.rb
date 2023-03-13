class Topic < ApplicationRecord
  has_one_attached :topic_image_1
  has_one_attached :topic_image_2
  has_one_attached :topic_image_3
  belongs_to :end_user
  belongs_to :community
  has_many :topic_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 600 }

  #ブックマークされているかの判定メソッド
  def bookmarked_by?(user)
    bookmarks.exists?(end_user_id: user.id)
  end

  # コメント返信時の通知メソッド ※トピックメンバー全員（通知を作成）
  def comment_reply_notification(current_end_user, comment_id)
    temp_ids = TopicComment.where(topic_id: id).where.not(end_user_id: current_end_user.id).distinct.pluck(:end_user_id)
    # コメントされていない場合は、トピック投稿者に通知を送る
    if temp_ids.blank?
      notification = current_end_user.active_notifications.new(topic_id: id, topic_comment_id: comment_id, visited_id: end_user_id, action: 'comment')
      notification.save if notification.valid?
    else
    # コメントされている場合は、コメント欄のメンバーに通知を送る
      temp_ids.each do |temp_id|
        notification = current_end_user.active_notifications.new(topic_id: id, topic_comment_id: comment_id, visited_id: temp_id, action: 'comment')
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
      end
    end
  end
end
