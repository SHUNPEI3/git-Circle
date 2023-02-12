class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :community_users, dependent: :destroy
  has_many :communities, through: :community_users

  has_many :user_personal_tags, dependent: :destroy
  has_many :personal_tags, through: :user_personal_tags

  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :topic_comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  enum sex: {
    sex_secret: 0, male: 1, female: 2, others: 3
  }

  enum activity_area: {
    activity_area_secret: 0,
    hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, fukushima: 7,
    ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, chiba: 12, tokyo: 13, kanagawa: 14,
    niigata: 15, toyama: 16, ishikawa: 17, fukui: 18, yamanashi: 19, nagano: 20, gifu: 21, shizuoka: 22, aichi: 23,
    mie: 24, shiga: 25, kyoto: 26, osaka: 27, hyogo: 28, nara: 29, wakayama: 30,
    tottori: 31, shimane: 32, okayama: 33, hiroshima: 34, yamaguchi: 35,
    tokushima: 36, kagawa: 37, ehime: 38, kochi: 39,
    fukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, oita: 44, miyazaki: 45, kagoshima: 46, okinawa: 47
  }

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit:[width, height]).processed
  end

  def self.guest
    find_or_create_by!(last_name: 'guest' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "guest"
      user.first_name = "user"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "ユーザー"
      user.nickname = "ゲストユーザー"
      user.sex = ""
      user.age = "nil"
      user.activity_area = ""
      user.introduction =""
    end
  end

  # ゲストユーザーかの判定メソッド
  def guest_user?
    self.email == 'guest@example.com'
  end

  # 退会済みユーザーの判定メソッド
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # すでにフォローしているかの判定メソッド
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  # タグの保存メソッド
  def save_tag(sent_tags)
    current_tags = self.personal_tags.pluck(:name) unless self.personal_tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    # 古いタグを消す
    old_tags.each do |old_name|
      self.personal_tags.delete PersonalTag.find_by(name: old_name)
    end
    # 新しいいタグを保存
    new_tags.each do |new_name|
      post_tag = PersonalTag.find_or_create_by(name: new_name)
      # self.user_personal_tags.new(end_user_id: @end_user.id, personal_tag_id: post_tag.id).save
      self.personal_tags << post_tag
    end
  end

  def self.search_for(content)
    EndUser.where("nickname Like?", "%#{content}%")
  end

end
