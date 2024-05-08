module Quizzes
  class Update
    include Interactor::Organizer

    organize Quizzes::Update::Execute

    after do
      ActionCable.server.broadcast("quiz_channel", {
        action: "update",
        msg: "Quiz updated"
      })
    end
  end
end
