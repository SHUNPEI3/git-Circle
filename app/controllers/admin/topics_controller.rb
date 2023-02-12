class Admin::TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update]

  def top
    @topics = Topic.all
  end

  def index
    @topics = Topic.where(community_id: params[:community_id])
  end

  def show
    @community = Community.find(params[:community_id])  #form_withには親のインスタンス変数を渡す必要がある
    @topic_comment = TopicComment.new
  end

  def edit
    @community = Community.find(params[:community_id])  #form_withには親のインスタンス変数を渡す必要がある
  end

  def update
    if @topic.update(topic_params)
      redirect_to admin_community_topic_path(@topic.community_id, @topic)
    else
      render edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body) #コミュニティIDは必要ない？
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

end
