module Quizzes
  class Create
    include Interactor::Organizer

    organize Quizzes::Create::Execute
  end
end
