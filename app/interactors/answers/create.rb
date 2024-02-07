module Answers
  class Create
    include Interactor::Organizer

    organize Answers::Create::Execute,
             Answers::Create::ValidateAnswers
  end
end
