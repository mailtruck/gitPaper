module GitPaper
  class OAuthClient
    class << self
      
      def rcfile
        if @rcfile.nil?
          @rcfile = RCFile.new 
        end
        @rcfile
      end
      
      def load(options)
        if self.rcfile.empty? || options[:authorize]
          new_profile(options)
        elsif self.rcfile.has_token?
          load_profile
        end
      end
      
      def load_profile
        new(self.rcfile.data)
      end
      
      def new_profile(options)
        new(options)
      end
      
    end
    
    attr_reader :consumer_key, :consumer_secret, :username, :password, :token, :secret
    def initialize(options = {})
      @username         = options[:username]
      @password         = options[:password]
      @consumer_key     = options[:consumer_key]
      @consumer_secret  = options[:consumer_secret]
      @token            = options[:token]
      @secret           = options[:secret]
      
      #consumer.http.use_ssl = true
      #consumer.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    
    [:get, :post, :put, :delete, :options, :head, :copy].each do |request_method|
      class_eval(<<-EVAL, __FILE__, __LINE__)
        def #{request_method}(url, *options)
          access_token.#{request_method}(url, *options)
        end
      EVAL
    end
    
    def get_access_token
      response = begin
        consumer.token_request(:post, consumer.access_token_path, nil, {}, client_params)
      rescue OAuth::Unauthorized
      end
      @token  = response[:oauth_token]
      @secret = response[:oauth_token_secret]
    end
    
    def client_params
      {:x_auth_username => username, :x_auth_password => password, :x_auth_mode => 'client_auth'}
    end
    
    def fetch_credentials
      access_token.post('https://www.instapaper.com/api/1/account/verify_credentials')
    end
    
    def authorized?
      res = fetch_credentials
      res.class == Net::HTTPOK 
    end
    
    def save
      self.class.rcfile << self
    end
    
    def consumer
      @consumer ||= OAuth::Consumer.new(
        consumer_key,
        consumer_secret, 
        :site => "https://www.instapaper.com/api/1",
        :access_token_path => "/oauth/access_token"
      )
    end
    
    def access_token
      @access_token ||= OAuth::AccessToken.new(consumer, token, secret)
    end
    
  end
end