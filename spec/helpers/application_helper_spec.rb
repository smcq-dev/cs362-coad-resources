require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title" do
    it "returns base title when page title is empty by default" do 
      expect(full_title).to eq("Disaster Resource Network")
    end
    it "returns base title when page title is an empty string" do
      expect(full_title("")).to eq("Disaster Resource Network")
    end
    it "returns full title when page title is provided" do
      expect(full_title("Home")).to eq("Home | Disaster Resource Network")
    end
  end
end
