require_relative '../rails_helper'

describe Board do
  describe 'validate with user' do
    context 'when not with user' do
      it do
        expect{Board.create!(name: 'hoge')}.to raise_error
      end
    end

    context 'when with user' do
      it  do
        expect{Board.create!(name: 'hoge', user: create(:user))}.not_to raise_error
      end
    end
  end
end
