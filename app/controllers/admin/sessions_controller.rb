class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :authenticate_admin!, only: [:new, :create]
  def new; end

  def create
    user = User.find_by(email: params[:admin][:email])
    if user && user.authenticate(params[:admin][:password])
      user_sign_in(user)
      redirect_to admin_root_path
    else
      render action: :new
    end
  end

  def destroy
    user_sign_out
    redirect_to new_admin_session_path
  end
end
