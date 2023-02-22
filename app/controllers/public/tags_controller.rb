class Public::TagsController < ApplicationController
  def show
    @tag_list = Tag.all.order(id: "DESC").limit(10)
    @tag = Tag.find(params[:id])
    @communities = @tag.communitys.page(params[:page]).per(8)
  end
end
