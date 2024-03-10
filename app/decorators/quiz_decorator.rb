class QuizDecorator < ApplicationDecorator
  delegate_all

  decorates_association :questions
end
