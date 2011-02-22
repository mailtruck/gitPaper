module GitPaper
  class Repo
    
    attr_reader :grit
    
    def initialize(path)
      @grit = Grit::Repo.new(path)
    rescue Grit::NoSuchPathError, Grit::InvalidGitRepositoryError
    end
    
    def exist?
      @grit && @grit.git.exists?
    end
    
    def bookmarks(user, email = nil)
      GitPaper::Bookmarks.new(self, user, email)
    end
    
  end
end