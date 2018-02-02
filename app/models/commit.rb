class Commit
  attr_reader :date, :full_name, :message
  def initialize(attrs = {})
     @date = Date.parse(attrs[:commit][:committer][:date])
     @full_name = attrs[:repository][:full_name]
     @message = attrs[:commit][:message]
  end
end
