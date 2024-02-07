class QuestionDecorator < ApplicationDecorator
  delegate_all

  decorates_associations :options
end
