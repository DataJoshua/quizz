class ResultDecorator < ApplicationDecorator
  delegate_all

  def total_score_formatted
    "#{object.total_score} / #{object.quiz.score}"
  end

  def total_score_percentaje
    percentaje = (object.total_score / object.quiz.score) * 100

    "#{percentaje.floor(1)}%"
  end
end
