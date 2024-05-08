class QuizJob
  include Sidekiq::Job

  def perform(quiz_id)
    quiz = Quiz.find_by(id: quiz_id)
    quiz.discard

    ActionCable.server.broadcast("quiz_channel", {
      action: "discarded",
      msg: "A Quiz has been discarded"
    })
  end
end
