class GithubDecorator
  def initialize(user)
    @user = user
    create_github_service
  end

  def create_github_service
    @github_service = GithubService.new(@user)
  end

  def list_five_repos
    repos = @github_service.user_repos
    repos[0..4].map do |repo|
      UserRepository.new(
        {
          name: repo[:name],
          html_url: repo[:html_url]
        }
      )
    end
  end

  def followers
    followers = @github_service.user_followers
    followers.map do |follower|
      Followers.new(
        {
          handle: follower[:login],
          url: follower[:html_url]
        }
      )
    end
  end

  def following
    following = @github_service.user_following
    following.map do |follower|
      UserFollowing.new(
        {
          handle: follower[:login],
          url: follower[:html_url]
        }
      )
    end
  end
end
