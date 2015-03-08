class SessionsController < ApplicationController

  # SHow login view
  def new
  end

  # Login
  def create
    id_name = params.require(:id_name)
    pass    = params.require(:password)
    user    = User.find_by(id_name: id_name)

    unless user && user.authenticate(pass)
      flash.alert = "ユーザー認証に失敗しました。"
      redirect_to action: :new; return
    end

    session[:user_id] = user.id
    flash.notice = 'Sign in が完了しました。'
    redirect_to root_path; return
  end

  # Logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
