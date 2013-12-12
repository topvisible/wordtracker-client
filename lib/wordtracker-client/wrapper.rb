require 'json'

module Wordtracker
  class Wrapper
    def initialize(response)
      response.keys.each do |key|
        response[(key.to_sym rescue key) || key] = response.delete(key)
      end

      @data = response
    end

    def to_json(*args)
      @data.to_json(*args)
    end

    def inspect
      @data.inspect
    end

    class << self
      def accessor(key)
        define_method(key) do
          @data[key]
        end
      end

      def timestamp(key)
        define_method(key) do
          Date.parse(@data[key])
        end
      end
    end
  end
end