require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do

    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end

  end

  describe "POST 'create'" do

    let(:user) { create(:user) }

    it "doesnt login invalid user" do
      post 'create', email: user.email, password: 'invalid_pass'
      expect(response).to render_template(:new)
      expect(flash[:error]).to be_present
    end

    it "logins valid user" do
      post 'create', email: user.email, password: 'valid_pass'
      expect(controller.current_user).to be_present
      expect(response).to redirect_to(:surveys)
      expect(flash[:notice]).to be_present
    end
  end

  describe "GET 'destroy'" do

    it "returns http success" do
      get 'destroy'
      expect(response).to redirect_to(:login)
      expect(flash[:notice]).to be_present
      expect(controller.current_user).to be_false
    end
  end
end