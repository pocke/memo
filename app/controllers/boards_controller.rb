class BoardsController < ApplicationController
  before_action :login_check

  def index
    @boards = current_user.boards

    render template: 'root/root'
  end

  def create
    name = params.require(:name)
    
    begin
      @board = Board.create!(name: name, user: current_user)
    rescue => ex
      Rails.logger.warn ex
      render text: "なにかがおかしいよ", status: 400 and return
    end

    render json: @board and return
  end
end
