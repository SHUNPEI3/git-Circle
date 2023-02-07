class Community < ApplicationRecord
  has_many :community_users, dependent: :destroy
  has_many :end_users, through: :community_users
  belongs_to :owner, class_name: 'EndUser'

  has_many :community_details, dependent: :destroy
end
