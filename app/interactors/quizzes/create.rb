module Quizzes
  class Create
    include Interactor::Organizer

    delegate :quiz, to: :context

    organize Quizzes::Create::Execute,
             Quizzes::Create::CreateUserQuizzes,
             Quizzes::Create::UpdateQuizScore,
             Quizzes::Create::CreateQuizDeprecateJob

    after do
      ActionCable.server.broadcast("quiz_creation_channel", {
        action: "create",
        msg: "A new Quiz has been created",
        quiz: quiz.id
      })
    end
  end
end
