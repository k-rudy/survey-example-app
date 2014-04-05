require "spec_helper"

describe UserSessionsController do

  describe "routing" do

    it "routes GET /login to :new" do
      expect(get "/login").to route_to("user_sessions#new")
    end

    it "routes POST /create to :create" do
      expect(post "/user_sessions").to route_to("user_sessions#create")
    end

    it "routes GET /logout to :destroy" do
      expect(get "/logout").to route_to("user_sessions#destroy")
    end
  end
end
