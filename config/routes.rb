Rails.application.routes.draw do

  #顧客用サインアップ・ログイン・ログアウト用
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'

    get 'about' => 'homes#about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
