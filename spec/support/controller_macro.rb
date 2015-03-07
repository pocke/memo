module ControllerMacros
  def login_user
    before do
      session[:user_id] = create(:user).id
    end
  end

  def should_be_success
    it{expect(response).to be_success}
  end

  def should_be_failure
    it{expect(response).not_to be_success}
  end
end
