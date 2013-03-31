require 'faraday'
require 'forwardable'

module Vineyard
  class Client
    extend Forwardable

  	    def_delegator :options, :hash

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Vineyard::Client]
    def initialize(options={})
      Vineyard::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Vineyard.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform an HTTP DELETE request
    def delete(path, params={})
      request(:delete, path, params)
    end

    # Perform an HTTP GET request
    def get(path, params={})
      request(:get, path, params)
    end

    # Perform an HTTP POST request
    def post(path, params={})
      signature_params = params.values.any?{|value| value.respond_to?(:to_io)} ? {} : params
      request(:post, path, params, signature_params)
    end

    # Perform an HTTP PUT request
    def put(path, params={})
      request(:put, path, params)
    end

    def connection
      @connection ||= begin
          Faraday.new('https://api.vineapp.com/', {})
      end
    end

    def reset!
      Vineyard::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Vineyard::Default.options[key])
      end
      self
    end
    alias setup reset!

    private

    def request(method, path, params={}, signature_params=params)
      connection.send(method.to_sym, path, params) do |request|
        # request.headers[:authorization] = auth_header(method.to_sym, path, signature_params).to_s
      end.env
    rescue Faraday::Error::ClientError
      # raise Vineyard::Error::ClientError
    rescue MultiJson::DecodeError
      # raise Vineyard::Error::DecodeError
    end

  end
end
