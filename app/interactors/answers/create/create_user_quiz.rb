module Answers
  class Create
    class CreateUserQuiz
      include Interactor

      delegate :user, :quiz, to: :context

      def call
        context.fail!(error: "Failded to create User_Quiz relation") unless user_quiz.save
      end

      private

      def user_quiz
        @user_quiz ||= UserQuiz.new(user:, quiz:)
      end
    end
  end
end
