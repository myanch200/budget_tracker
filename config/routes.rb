Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :groups do
    resources :group_users, only: %i[create destroy]
  end

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
