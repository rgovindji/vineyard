module Divine
  module Configurable
    def configure
      puts 'Configure!'
      # def self.authenticate(username = '', password = '')
      #   options = {
      #     :query => {
      #       'username' => username,
      #       'password' => password
      #     },
      #     :headers => {
      #       'Device-Token' => 'Divine',
      #       'User-Agent' => 'com.vine.iphone/1.01 (unknown, iPhone OS 6.0, iPad, Scale/2.000000) (Divine.js/0.0.1)'
      #     }
      #   }
      #   # puts options
      #   puts HTTParty.post 'https://api.vineapp.com/users/authenticate', options
      # end
    end
  end
end
