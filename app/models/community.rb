class Community < ApplicationRecord
  has_one_attached :community_image
  has_many :community_users, dependent: :destroy
  has_many :end_users, through: :community_users
  belongs_to :owner, class_name: "EndUser"
  has_many :community_messages, dependent: :destroy
  has_one :community_detail, dependent: :destroy
  accepts_nested_attributes_for :community_detail
  has_many :community_tags, dependent: :destroy
  has_many :tags, through: :community_tags
  has_many :topics, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :category, optional: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 600 }

  def get_community_image(width, height)
    unless community_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      community_image.attach(io: File.open(file_path), filename: "no-image.jpg", content_type: "image/jpeg")
    end
    community_image.variant(resize_to_fill: [width, height]).processed
  end

  # トピックが投稿された順でのコミュニティ情報を取得
  def self.lasted_post_community_get
    Community.find(Topic.order(created_at: :desc).pluck(:community_id))
  end

  # カテゴリー情報の保存メソッド
  def save_category(category_name)
    unless category_name == []
      category = Category.find_or_create_by(name: category_name)
      self.update(category_id: category.id)
    end
  end

  # タグ情報の保存メソッド
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end
    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(name: new_name)
      self.tags << post_tag
    end
  end

  def self.search_for(content)
    Community.where("name Like?", "%#{content}%")
  end

  # コミュニティに参加済みかの確認メソッド
  def already_joined?(end_user)
    community_users.exists?(end_user_id: end_user.id)
  end

  # コミュニティへの招待通知メソッド（通知を作成）
  def community_invitation_notification(current_end_user, visited_id)
    temp = Notification.where(visited_id: visited_id, community_id: id, action: "invitation")
    if temp.blank?
      notification = current_end_user.active_notifications.new(visited_id: visited_id, community_id: id, action: "invitation")
      notification.save if notification.valid?
    end
  end

  # コミュニティへの参加通知メソッド ※メンバー全員（通知を作成）
  def community_join_notification(current_end_user)
    temp_ids = CommunityUser.where(community_id: id).where.not(end_user_id: current_end_user.id).pluck(:end_user_id)
    temp_ids.each do |temp_id|
      notification = current_end_user.active_notifications.new(visited_id: temp_id, community_id: id, action: "join")
      notification.save if notification.valid?
    end
  end

  # トピック作成時の投稿通知メソッド ※メンバー全員（通知を作成）
  def topic_post_notification(current_end_user, topic_id)
    temp_ids = CommunityUser.where(community_id: id).where.not(end_user_id: current_end_user.id).pluck(:end_user_id)
    temp_ids.each do |temp_id|
      notification = current_end_user.active_notifications.new(visited_id: temp_id, community_id: id, topic_id: topic_id, action: "post")
      notification.save if notification.valid?
    end
  end

  paginates_per 8
end
