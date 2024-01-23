module Quizzes
  class Update
    include Interactor::Organizer

    organize Quizzes::Update::Execute
  end
end
