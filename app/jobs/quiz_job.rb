class QuizJob < ApplicationJob
  queue_as :default

  def perform(quiz:)
    quiz.discard
  end
end
