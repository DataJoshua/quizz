class OptionDecorator < ApplicationDecorator
  delegate :content, :to_key, :id

  def answer_for_this_option(user)
    answer = object.answers
                   .where(checked: true, user:)
                   .first

    answer ? answer.correct : nil
  end
end
