class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "end_user"
      @records = EndUser.search_for(@content)
    elsif @model == "personal_tag"
      @records = PersonalTag.search_for(@content)
    elsif @model == "community"
      @records = Community.search_for(@content)
    elsif @model == "community_tag"
      @records = Tag.search_for(@content)
    end
  end
end
