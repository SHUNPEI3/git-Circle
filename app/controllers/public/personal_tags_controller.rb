class Public::PersonalTagsController < ApplicationController
  def show
    @tag_list = PersonalTag.all.order(id: "DESC").page params[:page]
    @tag = PersonalTag.find(params[:id])
    @end_users = @tag.end_users.page(params[:page])
  end
end
