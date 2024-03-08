Rails.application.routes.draw do
  namespace :turbo do
    resources :registrations, only: %i[create]
  end

  root "registrations#new"

  resources :registrations, only: %i[new]
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
    resource :dashboard, only: %i[show], module: :students
  end
end
