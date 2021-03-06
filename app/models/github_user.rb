class GithubUser
  attr_reader :user
  def initialize(user)
    @user = user
  end

  def get_profile_info
    h = github.user_info
  end

  def organizations
    github.user_organizations.map do |org|
      org[:avatar_url]
    end
  end

  def commits
    github.user_commits(@user.nickname)[:items].map do |commit|
      Commit.new(commit)
    end

  end

  def repos
    github.user_repos.each.map do |repo|
      Repo.new(repo)
    end
    # binding.pry
  end

  def company
    get_profile_info[:company]
  end

  def user_bio
    get_profile_info[:bio]
  end

  def user_image
    get_profile_info[:avatar_url]
  end

  def user_followers
    get_profile_info[:followers]
  end

  def user_following
    get_profile_info[:following]
  end

  def user_number_of_starred_repos
    github.user_starred_repos.count
  end

  private

    def github
      @github ||= GithubService.new(@user)
      # binding.pry
    end

end
