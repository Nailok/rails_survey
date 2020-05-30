class Web::Respondent::RegistrationsController < Web::Respondent::ApplicationController
  skip_before_action :authenticate_respondent!, only: %i[new create]
  def new
    @respondent = Respondent.new
  end

  def create
    @respondent = Respondent.new(respondent_attrs)

    if @respondent.save
      redirect_to new_respondent_session_path
    else
      render action: :new
    end
  end

  private

  def respondent_attrs
    params.require(:respondent).permit(:first_name, :last_name, :phone)
  end
end
