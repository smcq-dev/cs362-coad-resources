require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  
  describe "dashboard_for" do

    it "returns admin dashboard for admin user" do
      user = User.new(role: :admin)
      expect(dashboard_for(user)).to eq("admin_dashboard")
    end

    it "returns submitted dashboard for a newly created organization" do
      org = Organization.new(status: :submitted)
      user = User.new(role: :organization, organization: org)
      expect(dashboard_for(user)).to eq("organization_submitted_dashboard")
    end

    it "returns approved dashboard for an organization with approved status" do
      org = Organization.new(status: :approved)
      user = User.new(role: :organization, organization: org)
      expect(dashboard_for(user)).to eq("organization_approved_dashboard")
    end

  end

end
