class Public::CategoriesController < ApplicationController
  def show
    @category_list = Category.all
    @tag_list = Tag.all.order(id: "DESC").page params[:page]
    @category = Category.find(params[:id])
    @communities = @category.communities.page(params[:community_page])
  end
end
