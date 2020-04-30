class SurveyDecorator < ApplicationDecorator
  decorates_association :user

  def created_at
    Russian.strftime(object.created_at, "%A, %B %e")
  end
end
