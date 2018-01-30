require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from a user hash" do
    auth = {
      provider: "github",
      uid: "1234567",
      info: {
        email: "gabe@gmail.com",
        name: "Gabriel Afflitto",
      }
    }

    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("1234567")
    expect(new_user.name).to eq("Gabriel Afflitto")
  end
end
