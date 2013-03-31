module Vineyard
  module Default
    class << self

      def username
        ENV['VINE_USERNAME']
      end

      # @return [String]
      def password
        ENV['VINE_PASSWORD']
      end
      def options
        Hash[Vineyard::Configurable.keys.map{|key| [key, send(key)]}]
      end
    end
  end
end
