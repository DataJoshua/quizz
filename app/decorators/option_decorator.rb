class OptionDecorator < ApplicationDecorator
  delegate :content, :to_key, :id

  def answer_for_this_option(answers)
    answers.where(option: object).first&.correct
  end
end
