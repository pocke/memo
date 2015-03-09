require_relative '../rails_helper'

describe BoardsController do
  login_user

  describe '#index' do
    before{get :index}

    should_be_success
  end
end
