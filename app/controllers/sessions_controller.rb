class SessionsController < ApplicationController
  def new
  end

  def create
    command = UserAuthenticator.call(session_params[:email], session_params[:password])
    if command.success?
      log_in command.user
      redirect_to user_courses_index_path(command.user)
    else
      flash[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url, notice: 'Logged out!'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
