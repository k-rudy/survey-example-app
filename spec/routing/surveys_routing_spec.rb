require "spec_helper"

describe SurveysController do
  
  describe "routing" do

    it "routes to #index" do
      expect(get("/surveys")).to route_to("surveys#index")
    end

    it "routes to #edit" do
      expect(get("/survey/qwe123")).to route_to("surveys#edit", token: "qwe123")
    end
    
    it "routes to #update" do
      expect(patch("/survey/qwe123")).to route_to("surveys#update", token: "qwe123")
    end

    it "routes to #create" do
      expect(post("/surveys")).to route_to("surveys#create")
    end
    
    it "routes to #thank_you" do
      expect(get("/survey/thank_you")).to route_to("surveys#thank_you")
    end
    
    it "routes to #search" do
      expect(post("/survey/search")).to route_to("surveys#search")
    end
  end
end
