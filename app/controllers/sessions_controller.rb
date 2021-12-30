class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Осуществить вход пользователя и перенаправление на страницу профиля.
    else
      flash[:danger] = 'Invalid email/password combination' # Не совсем верно!
      render 'new'
    end
  end

  def destroy

  end
end
