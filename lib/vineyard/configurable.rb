module Vineyard
  module Configurable

    attr_writer :username, :password

    class << self

      def keys
        @keys ||= [
          :username,
          :password
        ]
      end
    end

    def configure
      puts 'Configure!'
      yield self
      self
      # def self.authenticate(username = '', password = '')
      #   options = {
      #     :query => {
      #       'username' => username,
      #       'password' => password
      #     },
      #     :headers => {
      #       'Device-Token' => 'Vineyard',
      #       'User-Agent' => 'com.vine.iphone/1.01 (unknown, iPhone OS 6.0, iPad, Scale/2.000000) (Vineyard.js/0.0.1)'
      #     }
      #   }
      #   # puts options
      #   puts HTTParty.post 'https://api.vineapp.com/users/authenticate', options
      # end
    end
  end
end
