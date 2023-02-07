Rails.application.routes.draw do

  #顧客用サインアップ・ログイン用
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    # ユーザー関連
    resources 'end_users', only: [:index, :show, :edit, :update]
    get '/end_users/:id/unsubscribe' => 'end_users#unsubscribe', as: 'unsubscribe_end_user'
    patch '/end_users/:id/withdraw' => 'end_users#withdraw', as: 'withdraw_end_user'

    # コミュニティ関連
    resources 'communities', except: [:destroy] do
      resource 'community_users', only: [:create, :destroy]
    end
  end

  # 管理者用サインアップ用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top', as: 'home'
    resources 'end_users', only:[:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
