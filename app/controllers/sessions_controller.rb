class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.password_digest == params[:password] # user && user.authauthenticate(params[:password])
      
      if user.verified == true
        session[:user_id] = user.id

        redirect_to home_page_path(user.id), notice: 'Logged in!'
      else
        redirect_to verification_mail_send_path(user), notice: 'Thank you for signing up!'
      end
    else
      flash.now.alert = 'Email or password is invalid'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: 'Logged out!'
  end
end