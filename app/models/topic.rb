class Topic < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  has_many :topic_comments, dependent: :destroy
end
