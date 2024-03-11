class OptionDecorator < ApplicationDecorator
  delegate :content, :to_key, :id

  def answer_for_this_option(answers)
    answers.find_by(option: object)&.correct
  end
end
