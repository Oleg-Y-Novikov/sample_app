class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Осуществить вход пользователя и перенаправление на страницу профиля.
      log_in user # хелпер log_in
      redirect_to user # Rails автоматически конвертирует его в маршрут user_url(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy

  end
end
