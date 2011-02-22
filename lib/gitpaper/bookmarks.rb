module GitPaper
  class Bookmarks
    
    attr_reader :grit, :email
    def initialize(repo, user, email)
      @user = user
      @repo = repo
      @email = email
      @grit = repo.grit
    end
    
    def post(bookmark, options = {})
      write_html(bookmark["bookmark_id"], options[:html])
      msg = "#{bookmark["title"]} - #{bookmark["url"]}"
      @grit.commit_index(msg)
    end
    
    #def actor
    #  Grit::Actor.new(@user, @email)
    #end
    
    def write_html(id, html)
      file = File.expand_path(File.join(@grit.path, '..', "#{id.to_s}.html"))
      File.open(file, 'w') {|file| file.write html }
      @grit.add(file)
    end
    
  end
end