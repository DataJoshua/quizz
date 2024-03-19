module Quizzes
  class Create
    include Interactor::Organizer

    organize Quizzes::Create::Execute,
             Quizzes::Create::CreateUserQuizzes,
             Quizzes::Create::UpdateQuizScore,
             Quizzes::Create::CreateQuizDeprecateJob
  end
end
