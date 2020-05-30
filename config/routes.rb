Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope module: :answer do
        resources :choices, only: %i[create]
        resources :others, only: %i[create]
      end
      resources :surveys, only: %i[index show] do
        resources :questions, only: %i[index]
      end

      resource :session, only: :create
    end
  end

  scope module: :web do
    root to: "welcome#index"

    namespace :respondent do
      root to: "welcome#index"
      resources :welcome, only: %i[index show]
      resources :registrations, only: %i[new create]
      resource :session, only: %i[new create destroy]
      resource :profile, only: %i[show edit update]

      resources :surveys, only: %i[index new create show edit update destroy], shallow: true do
        resources :answers, only: %i[new create]
        resources :questions, only: %i[index new create destroy show], shallow: true do
          resources :variants, only: %i[index new create destroy edit update show]
        end

        member do
          put :del
          put :restore
        end
      end
    end

    namespace :admin do
      root to: "users#index"
      resource :session, only: %i[new create destroy]
      resources :users, only: %i[index show edit update] do
        member do
          put :in_archive
          put :restore
        end
      end
      resources :admins, only: %i[new create]
      resources :respondents, only: %i[new create]
      resources :tags

      resources :surveys, only: %i[index new create show edit update destroy], shallow: true do
        resources :questions, only: %i[index new create destroy show], shallow: true do
          resources :variants, only: %i[index new create destroy edit update show]
        end

        member do
          put :del
          put :restore
        end
      end

      scope module: :question do
        resources :questions, only: %i[index]
      end
    end
  end
end
