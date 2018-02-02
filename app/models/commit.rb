class Commit
  attr_reader :date, :full_name, :message
  def initialize(attrs = {})
     @date = Date.parse(attrs[:commit][:committer][:date])
     @full_name = attrs[:repository][:full_name]
     @message = attrs[:commit][:message]
  end

  # <%#= Date.parse(commit[:commit][:committer][:date]) %>
  # <%#= commit[:repository][:full_name] %>
  # <%#= commit[:commit][:message] %>

end
