class Repo
  attr_reader :name, :forked, :description, :language
  def initialize(attrs = {})
    @name = attrs[:name]
    @description = attrs[:description] if attrs[:description]
    @language = attrs[:language]
  end

end
