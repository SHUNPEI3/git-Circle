class Public::CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @communities = @category.communities
  end
end
