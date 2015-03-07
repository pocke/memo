class SessionsController < ApplicationController

  # SHow login view
  def new
  end

  # Login
  def create
    id_name = params.require(:id_name)
    pass    = params.require(:password)
    user    = User.find_by(id_name: id_name)

    if user && user.authenticate(pass)
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  # Logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
