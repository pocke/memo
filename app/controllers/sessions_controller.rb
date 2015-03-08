class SessionsController < ApplicationController

  # SHow login view
  def new
  end

  # Login
  def create
    id_name = params[:id_name]
    pass    = params[:password]

    e = -> (msg) {
      flash.alert = msg
      redirect_to action: :new
    }
    if id_name.blank?
      e.("IDを入力してください。");return
    end

    if pass.blank?
      e.("passwordを入力してください。");return
    end

    user = User.find_by(id_name: id_name)

    unless user && user.authenticate(pass)
      e.("ユーザー認証に失敗しました。");return
    end

    session[:user_id] = user.id
    flash.notice = 'Sign in が完了しました。'
    redirect_to root_path; return
  end

  def signout
    session[:user_id] = nil
    redirect_to root_path
  end
end
