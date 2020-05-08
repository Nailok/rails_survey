Rails.application.routes.draw do
  namespace :admin do
    root to: "users#index"
    resources :users, only: %i[index show edit update] do
      member do
        put :in_archive
        put :restore
      end
    end
    resources :admins, only: %i[new create]
    resources :respondents, only: %i[new create]
    resources :questions, only: %i[index new create destroy]
    resources :tags
    resources :surveys, only: %i[index new create show edit update destroy] do
      member do
        put :del
        put :restore
      end
    end
  end
end
