module Twitter
  module Default
      def options
        Hash[Twitter::Configurable.keys.map{|key| [key, send(key)]}]
      end
  end
end
