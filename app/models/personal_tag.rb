class PersonalTag < ApplicationRecord
  has_many :user_personal_tags, dependent: :destroy
  has_many :end_users, through: :user_personal_tags
end
