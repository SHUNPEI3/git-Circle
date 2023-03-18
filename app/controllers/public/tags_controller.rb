class Public::TagsController < ApplicationController
  def show
    @category_list = Category.all
    @tag_list = Tag.all.order(id: "DESC").page params[:page]
    @tag = Tag.find(params[:id])
    @communities = @tag.communities.page(params[:community_page])
  end
end
