class Tag < ApplicationRecord
  has_many :community_tags, dependent: :destroy
  has_many :communitys, through: :community_tags
end
