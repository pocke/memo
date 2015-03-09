class RootController < ApplicationController
  def root
    unless current_user
      redirect_to new_session_path;return
    end
  end
end
