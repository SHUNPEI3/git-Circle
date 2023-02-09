class Public::TopicsController < ApplicationController
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def new
    @topic = Topic.new
    #binding.pry
    @topic.community_id = params[:community_id]
  end

  def create
    topic = Topic.new(topic_params)
    topic.end_user_id = current_end_user.id
    if topic.save
      redirect_to topics_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      render edit
    end
  end

  def destroy

  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :community_id)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end


end
