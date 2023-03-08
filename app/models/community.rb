class Community < ApplicationRecord
  has_one_attached :community_image
  has_many :community_users, dependent: :destroy
  has_many :end_users, through: :community_users
  belongs_to :owner, class_name: 'EndUser'
  has_many :community_details, dependent: :destroy
  accepts_nested_attributes_for :community_details, allow_destroy: true
  has_many :community_tags, dependent: :destroy
  has_many :tags, through: :community_tags
  has_many :topics, dependent: :destroy
  has_many :topic_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  belongs_to :category, optional: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 600 }

  def get_community_image(width,height)
    unless community_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      community_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    community_image.variant(resize_to_fill:[width, height]).processed
  end

  # カテゴリー情報の保存メソッド
  def save_category(category_name)
    category = Category.find_or_create_by(name: category_name)
    self.update(category_id: category.id)
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

  # コミュニティに参加済みかの確認メソッド
  def already_joined?(end_user)
    community_users.exists?(end_user_id: end_user.id)
  end

  def self.search_for(content)
    Community.where("name Like?", "%#{content}%")
  end

  # コミュニティへの招待メソッド（通知を作成）
  def community_invitation_notification(current_end_user, visited_id, community_id)
    temp = Notification.where(visited_id: visited_id, community_id: community_id, action: "invitation")
    unless temp.exists?
      notification = current_end_user.active_notifications.new(visited_id: visited_id, community_id: community_id, action: "invitation")
      notification.save if notification.valid?
    end
  end

  # コミュニティへの参加通知メソッド ※メンバー全員（通知を作成）
  def community_join_notification(current_end_user, community_id)
    temp_ids = CommunityUser.where(community_id: community_id).where.not(end_user_id: current_end_user.id).pluck(:end_user_id)
    temp_ids.each do |temp_id|
      notification = current_end_user.active_notifications.new(visited_id: temp_id, community_id: community_id, action: 'join')
      # if notification.visitor_id == notification.visited_id
      #   notification.checked = true
      # end
      notification.save if notification.valid?
    end
  end
end