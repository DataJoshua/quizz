module Quizzes
  class Create
    class CreateUserQuizzes
      include Interactor

      delegate :quiz, :user, to: :context

      def call
        context.fail!(error: user_quizzes.errors.full_messages.join(", ")) unless user_quizzes.save
      end

      private

      def user_quizzes
        @user_quizzes ||= UserQuiz.new(user: user, quiz: quiz)
      end
    end
  end
end
