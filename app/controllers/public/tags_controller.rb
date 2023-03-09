class Public::TagsController < ApplicationController
  def show
    @tag_list = Tag.all.order(id: "DESC").page params[:page]
    @tag = Tag.find(params[:id])
    @community = @tag.communities.page(params[:page])

  end
end
