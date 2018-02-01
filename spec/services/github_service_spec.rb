require 'rails_helper'

describe GithubService do
  let(:githubservice){GithubService.new()}
  before :each do
    user = user.create(uid: "123123", nickname: "Gabe", name: "Gabriel Afflitto", email: "Gabe@gmail.com", token: "2354h456kh1kj2h34kj54")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end
