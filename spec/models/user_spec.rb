require_relative '../rails_helper'

describe User do
  describe '#create' do
    it 'should generate password' do
      u = User.create!(attributes_for(:user))
      expect(u.password_digest).to be_a String
    end
  end
end
