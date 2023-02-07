class Community < ApplicationRecord
  has_many :community_users, dependent: :destroy
  has_many :end_users, thorogh: :community_users, dependent: :destroy
  belongs_to :owner, class_name: 'EndUser'

  has_many :community_details, dependent: :destroy
end
