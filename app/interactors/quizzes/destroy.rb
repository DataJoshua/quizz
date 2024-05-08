module Quizzes
  class Destroy
    include Interactor::Organizer

    delegate :quiz, to: :context

    organize Quizzes::Destroy::Execute

    after do
      if quiz.undiscarded?
        ActionCable.server.broadcast("quiz_channel", {
          action: "deleted",
          msg: "An Quiz #{quiz.name} has been deleted"
        })
      end
    end
  end
end
