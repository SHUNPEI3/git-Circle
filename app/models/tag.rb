class Tag < ApplicationRecord
  has_many :community_tags, dependent: :destroy
  has_many :communities, through: :community_tags

  def self.search_for(content)
    Tag.where("name Like?", "%#{content}%")
  end

  paginates_per 8
end
