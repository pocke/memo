class BoardsController < ApplicationController
  before_action :login_check

  def index
    render template: 'root/root'
  end

  def create
    name = params.require(:name)
    
    begin
      @board = Board.create!(name: name)
    rescue => ex
    end
  end
end
