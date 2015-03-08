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

  describe '#current_user' do
    controller do
      def index
        @user = current_user
        render nothing: true
      end
    end
    let(:req){get :index}

    context 'when not login' do
      before{req}
      it '@user should be nil' do
        expect(assigns[:user]).to be nil
      end
    end

    context 'when login' do
      login_user
      before{req}
      it 'should assign @user' do
        expect(assigns[:user]).to be_a User
      end
    end
  end
end
