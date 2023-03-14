class Admin::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "end_user"
      @records = EndUser.search_for(@content)
    elsif @model == "community"
      @records = Community.search_for(@content)
    elsif @model == "topic"
      @records = Topic.search_for(@content)
    elsif @model == "comment"
      @records = TopicComment.search_for(@content)
    end
  end
end
