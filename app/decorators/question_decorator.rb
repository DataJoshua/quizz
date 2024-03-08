class QuestionDecorator < ApplicationDecorator
  delegate_all

  decorates_association :options

  def points_obtained(answers)
    options = object.options

    answers
          .where(option: options, correct: true)
          .size * object.value
  end
end
