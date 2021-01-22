Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, constraints: { format: 'json' } do
    resources :people, only: [:show]
    resources :planets, only: [:show]
  end
end
