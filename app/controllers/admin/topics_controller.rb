class Admin::TopicsController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_community, except: [:topic_list, :update]
  before_action :find_topic, only: [:show, :edit, :update, :destroy]

  def topic_list
    @topics = Topic.all.order(id: "DESC").page(params[:page]).per(20)
  end

  def index
    @topics = Topic.where(community_id: params[:community_id]).order(id: "DESC").page(params[:page]).per(10)
  end

  def show
    @topic_comment = TopicComment.new
    @topic_comments = @topic.topic_comments
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to admin_community_topic_path(@topic.community_id, @topic), notice: "更新が完了しました！"
    else
      flash.now[:alert] = "更新に失敗しました"
      render edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to admin_topics_path, notice: "削除が完了しました！"
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :body, :topic_image_1, :topic_image_2, :topic_image_3)
    end

    def find_community
      @community = Community.find(params[:community_id])
    end

    def find_topic
      @topic = Topic.find(params[:id])
    end
end
