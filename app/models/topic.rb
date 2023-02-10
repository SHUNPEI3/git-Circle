class Topic < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  has_many :topic_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  #ブックマークされているかの判定メソッド
  def bookmarked_by?(user)
    bookmarks.exists?(end_user_id: user.id)
  end
end
