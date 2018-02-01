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
        image: "https://avatars2.githubcontent.com"
      },
      credentials: {token: "a3jh34jh5g34gjj4hg35jh"}
    })
  end

  before :each do
    stub_omniauth
  end

  context "using Github" do
    it "should allow user to log in" do
      VCR.use_cassette("user can log in") do
        visit root_path

        expect(page).to have_content("Sign in with Github")

        click_link "Sign in with Github"
        expect(page).to have_content("Gabriel Afflitto")
        expect(page).to have_content("Logout")
      end
    end
  end
end
