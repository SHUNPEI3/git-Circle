class Public::TopicsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :find_community, only: [:new, :create, :show, :edit]
  before_action :find_topic, only: [:show, :edit, :update]
  before_action :ensure_community_mennber, only: [:index, :show, :edit]
  before_action :is_matching_topic_author, only: [:edit, :update]

  def index
    @topics = Topic.where(community_id: params[:community_id]).order(id: "DESC").page(params[:page]).per(10)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_end_user.topics.new(topic_params)
    @topic.community_id = @community.id
    if @topic.save
      redirect_to community_topics_path, notice: "投稿完了しました！"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render 'new'
    end
  end

  def show
    @topic_comment = TopicComment.new
    @topic_comments = @topic.topic_comments.page(params[:page]).per(20)
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to community_topic_path(@topic.community_id, @topic), notice: "更新が完了しました！"
    else
      flash.now[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body)
  end

  def find_community
    @community = Community.find(params[:community_id]) #form_withには親のインスタンス変数を渡す必要がある
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

  # コミュニティメンバーの確認（メンバーでなければトピックを参照できない）
  def ensure_community_mennber
    community = Community.find(params[:community_id])
    unless community.community_users.exists?(end_user_id: current_end_user.id)
      redirect_to community_path(community), alert: '〔注意〕コミュニティの参加者のみ閲覧が可能です。'
    end
  end

  def is_matching_topic_author
    @topic = Topic.find(params[:id])
    unless @topic.end_user == current_end_user
     redirect_to end_user_path(current_end_user), alert: '投稿者以外はトピック編集画面へ遷移できません。'
    end
  end
end