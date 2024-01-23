module Quizzes
  class Destroy
    include Interactor::Organizer

    organize Quizzes::Destroy::Execute
  end
end
