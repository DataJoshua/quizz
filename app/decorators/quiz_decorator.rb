class QuizDecorator < ApplicationDecorator
  delegate_all

  decorates_associations :questions
end
