Rails.application.routes.draw do

  #会員用サインアップ・ログイン用
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #ゲスト用ログイン機能
  devise_scope :end_user do
    post 'end_user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'searches#search'
    resources :categories, only: [:show]
    resources :personal_tags, only: [:show]
    resources :tags, only: [:show]
    resources :notifications, only: [:index]

    # ユーザー関連
    resources 'end_users', only: [:index, :show, :edit, :update] do
      resource 'relationships', only: [:create, :destroy]
      get :following, on: :member
      get :follower, on: :member
      get :unsubscribe, on: :member
      patch :withdraw, on: :member
    end

    # コミュニティ関連
    resources 'communities', except: [:destroy] do
      get :member, on: :member
      post :invitation
      resource 'community_users', only: [:create, :destroy] do
        delete :evict
      end
      # トピック関連
      resources 'topics', except: [:destroy] do
        resource 'bookmarks', only: [:create, :destroy]
        resources 'topic_comments', only: [:create, :destroy] do
          resource 'goods', only: [:create, :destroy]
        end
      end
    end
  end

  # 管理者用サインアップ用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top', as: 'home'
    resources 'end_users', only: [:show, :edit, :update]
    resources 'communities', only: [:index, :show, :edit, :update, :destroy] do
      resources 'topics', only: [:index, :show, :edit, :update, :destroy] do
        resources 'topic_comments', only: [:update, :destroy]
      end
    end
    get 'topics/topic_list', as: 'topics'
    get 'topic_comments/topic_comment_list', as: 'topic_comments'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
