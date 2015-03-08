require_relative '../rails_helper'

describe SessionsController do
  describe '#new' do
    let(:req){get :new}
    before{req}
    should_be_success
  end

  describe '#create' do
    let(:password){'p@ssw0rd'}
    let(:id_name){'hogefugapoyo'}
    let(:req){post :create, id_name: id_name, password: password}
    before{req}

    context 'when user does not exists' do

      it{is_expected.to redirect_to action: :new}
    end

    context 'when user exists' do
      let(:user){create(:user)}

      context 'when invalid password' do
        let(:password){'honyaafjadhfsk'}
        let(:id_name){user.id_name}

        it{is_expected.to redirect_to action: :new}
      end

      context 'when valid password' do
        let(:password){user.password}
        let(:id_name){user.id_name}

        it{is_expected.to redirect_to root_path}
      end
    end
  end

  describe '#destroy' do
    before{delete :destroy}
    it{is_expected.to redirect_to root_path}
  end
end
