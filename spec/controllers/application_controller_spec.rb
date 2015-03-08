require_relative '../rails_helper'

describe ApplicationController do
  describe '#login_check' do
    controller do
      before_action :login_check
      def index
        render nothing: true
      end
    end
    let(:req){get :index}

    context 'when not login' do
      before{req}
      it{is_expected.to redirect_to root_path}
    end

    context 'when login' do
      login_user
      before{req}

      should_be_success
    end
  end
end
