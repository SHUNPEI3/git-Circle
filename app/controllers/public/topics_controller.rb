class Public::TopicsController < ApplicationController
  before_action :ensure_community_mennber, only: [:index, :show]
  before_action :find_topic, only: [:show, :edit, :update]

  def index
    @topics = Topic.where(community_id: params[:community_id])
  end

  def new
    @community = Community.find(params[:community_id])  #form_withには親のインスタンス変数を渡す必要がある
    @topic = Topic.new
  end

  def create
    @community = Community.find(params[:community_id])
    @topic = current_end_user.topics.new(topic_params)
    @topic.community_id = @community.id
    if @topic.save
      flash[:notice] = "投稿完了しました！"
      redirect_to community_topics_path
    else
      flash[:alert] = "投稿に失敗しました"
      render 'new'
    end
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
      flash[:notice] = "投稿完了しました！"
      redirect_to community_topic_path(@topic.community_id, @topic)
    else
      flash[:alert] = "投稿に失敗しました"
      render 'edit'
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body) #コミュニティIDは必要ない？
  end

  def find_topic
    @topic = Topic.find(params[:id])
  end

  # コミュニティメンバーの確認（メンバーでなければトピックを参照できない）
  def ensure_community_mennber
    community = Community.find(params[:community_id])
    unless community.community_users.exists?(end_user_id: current_end_user.id)
      flash[:notice] = '〔注意〕コミュニティの参加者のみ閲覧が可能です。'
      redirect_to request.referer
    end
  end
end
