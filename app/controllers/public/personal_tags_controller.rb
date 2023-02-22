class Public::PersonalTagsController < ApplicationController
  def show
    @tag_list = PersonalTag.all.order(id: "DESC").limit(10)
    @tag = PersonalTag.find(params[:id])
    @end_users = @tag.end_users.page(params[:page]).per(8)
  end
end
