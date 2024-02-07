class QuestionDecorator < ApplicationDecorator
  delegate_all

  decorates_association :options
end
