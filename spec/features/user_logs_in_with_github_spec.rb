require 'rails_helper'

RSpec.feature "user can log in" do
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: "github",
      uid: "1234567",
      info: {
        email: "gabe@gmail.com",
        name: "Gabriel Afflitto",
      },
      credentials: {
        token: "abcdefg12345",
        expires: false
      }
    })
  end

  before :each do
    stub_omniauth
  end

  context "using Github" do
    it "should allow user to log in" do

      visit root_path

      expect(page).to have_content("Sign in with Github")

      click_link "Sign in with Github"

      expect(page).to have_content("Gabriel Afflitto")
      expect(page).to have_content("Logout")
    end
  end
end
