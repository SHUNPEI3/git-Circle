class Notification < ApplicationRecord
  belongs_to :visitor, class_name: 'EndUser', foreign_key: 'visitor_id'
  belongs_to :visited, class_name: 'EndUser', foreign_key: 'visited_id'
  belongs_to :community, optional: true
  belongs_to :topic, optional: true
end
