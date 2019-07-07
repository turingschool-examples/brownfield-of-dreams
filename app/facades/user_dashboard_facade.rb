class UserDashboardFacade
  def initialize(token)
    @token = token
  end

  def repos(limit)
		return nil if @token.nil? || @token.github_token.nil?
    repos = github_service.find_repositories
    repo_objects = repos.map do |repo|
      Repository.new(repo)
    end
    repo_objects.take(limit)
  end

  def followers(limit)
		return nil if @token.nil? || @token.github_token.nil?
    followers = github_service.find_followers
    github_users = followers.map do |github_user|
      GithubUser.new(github_user)
    end
    github_users.take(limit)
  end

  def following(limit)
		return nil if @token.nil? || @token.github_token.nil?
    following = github_service.find_following
    github_users = following.map do |github_user|
      GithubUser.new(github_user)
    end
    github_users.take(limit)
  end

  private

  def github_service
    GithubService.new(@token.github_token)
  end
end
