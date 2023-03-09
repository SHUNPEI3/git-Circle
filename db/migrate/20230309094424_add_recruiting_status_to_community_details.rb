class AddRecruitingStatusToCommunityDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :community_details, :recruiting_status, :integer, null: false, default: 0
  end
end
