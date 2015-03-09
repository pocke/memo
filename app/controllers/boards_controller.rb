class BoardsController < ApplicationController
  before_action :login_check

  def index
    render template: 'root/root'
  end
end
