class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def topic_list
    @topics = Topic.all.order(id: "DESC").page(params[:page]).per(20)
  end

  def index
    @topics = Topic.where(community_id: params[:community_id]).order(id: "DESC").page(params[:page]).per(10)
  end

  def show
    @community = Community.find(params[:community_id])
    @topic_comment = TopicComment.new
  end

  def edit
    @community = Community.find(params[:community_id])
  end

  def update
    if @topic.update(topic_params)
      redirect_to admin_community_topic_path(@topic.community_id, @topic)
    else
      render edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to admin_topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end
end
