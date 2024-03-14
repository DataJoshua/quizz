module Answers
  class Create
    include Interactor::Organizer

    organize Answers::Create::CreateResult,
             Answers::Create::ValidateAnswers
  end
end
