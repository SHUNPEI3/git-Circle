class TopicComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  belongs_to :topic
  has_many :goods, dependent: :destroy

  #コメントにいいねされているかの判定メソッド
  def good_by?(user)
    goods.exists?(end_user_id: user.id)
  end
end
