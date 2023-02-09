class Public::TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update]

  def index
    @topics = Topic.where(community_id: params[:community_id])
  end

  def new
    @topic = Topic.new
    @community = Community.find(params[:community_id])  #form_withには親のインスタンス変数を渡す必要がある
  end

  def create
    community = Community.find(params[:community_id])
    topic = current_end_user.topics.new(topic_params)
    topic.community_id = community.id
    if topic.save
      redirect_to community_topics_path
    end
  end

  def show
  end

  def edit
    @community = Community.find(params[:community_id])  #form_withには親のインスタンス変数を渡す必要がある
  end

  def update
    if  @topic.update(topic_params)
      redirect_to community_topic_path(@topic.community_id, @topic)
    else
      render edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :community_id)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

end
