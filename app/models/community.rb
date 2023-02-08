class Community < ApplicationRecord

  has_one_attached :community_image

  has_many :community_users, dependent: :destroy
  has_many :end_users, through: :community_users
  belongs_to :owner, class_name: 'EndUser'

  has_many :community_details, dependent: :destroy
  accepts_nested_attributes_for :community_details, allow_destroy: true

  has_many :community_tags, dependent: :destroy
  has_many :tags, through: :community_tags

  def get_community_image(width,height)
    unless community_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      community_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    community_image.variant(resize_to_limit:[width, height]).processed
  end

  # タグの保存メソッド
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
end
