class GithubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers['Authorization'] = "token #{@user.token}"
      faraday.headers['Accept'] = "application/vnd.github.cloak-preview"
      faraday.adapter Faraday.default_adapter
    end
  end

  def user_info
    response = @conn.get("/user")
    b = JSON.parse(response.body, symbolize_names: true)
  end

  def user_starred_repos
    response = @conn.get("/user/starred")
    b = JSON.parse(response.body, symbolize_names: true)
  end

  def user_repos
    response = @conn.get("/user/repos?type=owner", per_page: 100)
    b = JSON.parse(response.body, symbolize_names: true)
  end

  def user_organizations
    response = @conn.get("/user/orgs")
    b = JSON.parse(response.body, symbolize_names: true)
  end

  def user_commits(user)
    last_week = 1.week.ago.strftime("%Y-%m-%d")
    response = @conn.get("/search/commits?q=committer:#{user}+committer-date:>#{last_week}", per_page: 10)
    b = JSON.parse(response.body, symbolize_names: true)
  end

  def following
    response = @conn.get("/user/following")
    b = JSON.parse(response.body, symbolize_names: true)
  end

  def detailed_following_info
    following.map do |followed_person|
      response = @conn.get("/users/#{followed_person[:login]}")
      b = JSON.parse(response.body, symbolize_names: true)
    end
  end

end
