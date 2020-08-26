Rails.application.routes.draw do
  root to: 'items#index'
  get '/sing_in', to: 'sessions#new'
  get '/sign_up', to: 'registrations#new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
