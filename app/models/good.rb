class Good < ApplicationRecord
  belongs_to :end_user
  belongs_to :topic_comment
end
