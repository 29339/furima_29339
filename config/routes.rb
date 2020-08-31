Rails.application.routes.draw do
  root to: 'items#index'
  get '/sing_in', to: 'sessions#new'
  get '/sign_up', to: 'registrations#new'
  devise_for :users
<<<<<<< Updated upstream
  get 'items_new_path', to: 'items#new'
  resources :items, only: :create
  # dbのルーティングとモデルとビューの紐付け周り　保存させる
=======
  resources :items, only: [:new, :create, :index, :show]
>>>>>>> Stashed changes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
