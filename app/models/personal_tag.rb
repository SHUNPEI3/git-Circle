class PersonalTag < ApplicationRecord
  has_many :user_personal_tags, dependent: :destroy
  has_many :end_users, through: :user_personal_tags

  def self.search_for(content)
    PersonalTag.where("name Like?", "%#{content}%")
  end
end
