class Web::Respondent::StatisticsController < Web::Respondent::ApplicationController
  def show
    @question = Question.find(params[:id])
    # @variants = @question.variants
    @answers = @question.answers
    # @count = Answers.where(question_id: @questions.id).count
  end
end
