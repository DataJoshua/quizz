require "sidekiq/web"

Rails.application.routes.draw do
  namespace :turbo do
    resource :registration, only: %i[create]
  end

  root "registrations#new"

  resource :registration, only: %i[new]
  resource :session, only: %i[new create destroy]

  constraints(TeacherContraint) do
    scope module: :teachers do
      resource :dashboard, only: %i[show]
      resources :quizzes, only: %i[edit update create new destroy]
    end

    namespace :turbo do
      resources :quizzes, only: %i[create], module: :teachers
    end
  end

  constraints(StudentContraint) do
    scope module: :students do
      resource :dashboard, only: %i[show]
      resources :quizzes, only: %i[show] do
        resources :answers, only: %i[create]
      end
    end
  end

  if Rails.env.production?
    mount Sidekiq::Web => "/sidekiq"
  end
end
