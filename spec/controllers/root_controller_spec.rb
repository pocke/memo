require_relative '../rails_helper'

describe RootController do
  describe '#root' do
    let(:req){get :root}
    context 'when not login' do
      before{req}
      it{is_expected.to redirect_to new_session_path}
    end

    context 'when login' do
      login_user
      before{req}
      should_be_success
    end
  end
end
