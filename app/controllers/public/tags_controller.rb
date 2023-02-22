class Public::TagsController < ApplicationController
  def show
    @tag_list = Tag.all.order(id: "DESC").page params[:page]
    @tag = Tag.find(params[:id])
    @communities = @tag.communitys.page(params[:page]).per(8)
  end
end
