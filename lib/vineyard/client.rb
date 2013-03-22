module Vineyard
  class Client
    def connection
      @connection ||= begin
          Faraday.new('https://api.vineapp.com/', {})
      end
    end
  end
end
