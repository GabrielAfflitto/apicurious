require 'rails_helper'

describe "user can see dashboard" do
  scenario "with valid credentials" do
    # VCR.use_cassette "user sees dashboard" do
      @user = instance_double("User", name: "Gabe", nickname: "GabrielAfflitto", email: "Gabe@gmail.com", token: ENV["GITHUB_USER_TOKEN"])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      dashboard = stub_request(:get, "https://api.github.com/search/commits?per_page=10&q=committer:GabrielAfflitto%20committer-date:%3E2018-01-25").
        to_return({body: File.open("/Users/gabriel/turing/3module/projects/apicurious/spec/filters/commits_response.yml")})

      visit dashboard_path

      commits_response = JSON.parse(dashboard.response.body)["items"]
      expect(commits_response.first["repository"]).to have_key("full_name")
      expect(commits_response.first["commit"]["committer"]).to have_key("date")
      expect(commits_response.first["commit"]).to have_key("message")
      expect(page).to have_content("GabrielAfflitto/bad_connection")

      within ".commits" do
        expect(page).to have_content("Recent commits from the week:")
        expect(page).to have_css(".commit", count: 10)
      end
    # end
  end

  scenario "user can see basic account information" do
    # VCR.use_cassette "user sees basic account information" do
      @user = instance_double("User", name: "Gabe", nickname: "GabrielAfflitto", email: "Gabe@gmail.com", token: ENV["GITHUB_USER_TOKEN"])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      dashboard = stub_request(:get, "https://api.github.com/user").
        to_return({body: File.open("/Users/gabriel/turing/3module/projects/apicurious/spec/filters/user_info_response.yml")})

        dashboard_path

        info_response = JSON.parse(dashboard.response.body)

        expect(page).to have_content("Gabriel Afflitto")
        expect(info_response).to have_key("bio")
    # end
  end
end
