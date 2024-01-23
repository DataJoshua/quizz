module Quizzes
  class Create
    include Interactor::Organizer

    organize Quizzes::Create::Execute,
             Quizzes::Create::CreateUserQuizzes
  end
end
