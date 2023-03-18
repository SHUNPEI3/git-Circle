class TopicComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  belongs_to :topic
  has_many :goods, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 1000 }

  # コメントにいいねされているかの判定メソッド
  def good_by?(user)
    goods.exists?(end_user_id: user.id)
  end

  def self.search_for(content)
    TopicComment.where("comment Like?", "%#{content}%")
  end
end
