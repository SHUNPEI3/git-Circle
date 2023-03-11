class CommunityMessage < ApplicationRecord
  belongs_to :end_user
  belongs_to :community
  belongs_to :parent,  class_name: "CommunityMessage", optional: true
  has_many   :replies, class_name: "CommunityMessage", foreign_key: :parent_id, dependent: :destroy
end