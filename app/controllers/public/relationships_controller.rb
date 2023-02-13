class Public::RelationshipsController < ApplicationController
  before_action :find_follower_user

  def create
    relationship = current_end_user.active_relationships.new
    relationship.follower_id = @follower_user.id
    relationship.save
    render 'relationship'
  end

  def destroy
    relationship = Relationship.find_by(following_id: current_end_user.id, follower_id: @follower_user.id)
    relationship.destroy
    render 'relationship'
  end

  private

  def find_follower_user
    @follower_user = EndUser.find(params[:end_user_id])
  end

end