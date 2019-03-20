require 'rails_helper'

RSpec.describe GithubService do
  before :each do
    @user1 = create(:user)
    create(:github_token, user: @user1, token: ENV['USER_1_GITHUB_TOKEN'])
  end

  it "exists" do
    service = GithubService.new(@user1)
    expect(service).to be_a(GithubService)
  end

  context "instance methods" do
    it "gets user repositories", :vcr do
      service = GithubService.new(@user1)

      results = service.get_repos
      repository = results.first
      expect(repository[:name]).to eq("battleship")
      expect(repository[:html_url]).to eq("https://github.com/m-mrcr/battleship")
    end

    it 'gets users followed', :vcr do
      service = GithubService.new(@user1)
      results = service.get_users_followed
      first_user_followed = results.first

      expect(first_user_followed[:login]).to eq("jamisonordway")
      expect(first_user_followed[:html_url]).to eq("https://github.com/jamisonordway")

    end

  end
end
