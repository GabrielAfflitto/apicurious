require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from a user hash" do
    auth = {
      uid: "1234567",
      info: {
        nickname: "GABE",
        email: "gabe@gmail.com",
        name: "Gabriel Afflitto",
      },
      credentials: {
        token: "a3jh34jh5g34gjj4hg35jh"
      }
    }

    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.uid).to eq("1234567")
    expect(new_user.nickname).to eq("GABE")
    expect(new_user.name).to eq("Gabriel Afflitto")
  end
end
