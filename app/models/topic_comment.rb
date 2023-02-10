class TopicComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  belongs_to :topic
  has_many :goods, dependent: :destroy
end
