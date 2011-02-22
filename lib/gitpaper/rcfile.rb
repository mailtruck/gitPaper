
module GitPaper
  class RCFile
    FILE = '.gitpaperrc'
    @directory ||= ENV['HOME']
    
    class << self
      attr_accessor :directory
      
      def file_path
        File.join(directory, FILE)
      end
      
      def load
        YAML.load_file(file_path)
      rescue Errno::ENOENT
        default_rcfile
      end
      
      def default_rcfile
        {:username => '', :token => '', :secret => ''}
      end
    end
    
    attr_reader :data
    def initialize
      @data = self.class.load
    end
    
    def has_token?
      data.include?(:token)
    end
    
    def empty?
      data == self.class.default_rcfile
    end
    
    def save(profile)
      File.open(self.class.file_path, 'w') do |rc|
        rc.write profile.to_yaml
      end
    end
    
    def <<(oauth_client)
      profile = data || {}
      profile.merge!({
        :username => oauth_client.username,
        :token => oauth_client.token,
        :secret => oauth_client.secret,
        :consumer_key => oauth_client.consumer_key,
        :consumer_secret => oauth_client.consumer_secret
      })
      save(profile)
    end
    
  end
end