class Web::Respondent::RespondentsController < Web::Respondent::ApplicationController
  def new
    @respondent = Respondent.new
  end

  def create
    @respondent = Respondent.new(respondent_attrs)

    if @respondent.save
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  private

  def respondent_attrs
    params.require(:respondent).permit(:first_name, :last_name, :phone)
  end
end
