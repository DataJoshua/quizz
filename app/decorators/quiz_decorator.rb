class QuizDecorator < ApplicationDecorator
  delegate_all

  decorates_association :questions

  def formated_discarded_at
    discarded_at.strftime("%B %d, %Y %I:%M %p")
  end
end
