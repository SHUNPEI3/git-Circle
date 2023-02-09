class UserPersonalTag < ApplicationRecord
  belongs_to :end_user
  belongs_to :personal_tag
end
