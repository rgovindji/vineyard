require 'vineyard/default'

module Vineyard
  module Configurable

    extend Forwardable

    attr_writer :username, :password
    def_delegator :options, :hash

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
    end

    def reset!
      Vineyard::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", Vineyard::Default.options[key])
      end
      self
    end
    alias setup reset!

  end
end
