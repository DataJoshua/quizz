module Answers
  class Create
    include Interactor::Organizer

    organize Answers::Create::CreateResult,
             Answers::Create::Execute,
             Answers::Create::ValidateAnswers,
             Answers::Create::CreateUserQuiz
  end
end