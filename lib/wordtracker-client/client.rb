require 'json'
require 'faraday'

module Wordtracker
  class Client
    def initialize(app_id, app_key, url = nil)
      @options = { app_id: app_id, app_key: app_key }
      @connection = Faraday.new(url: url || self.api_url)
    end

    def fetch(keywords, options = {})
      input = case keywords
      when Array
        { keywords: keywords }
      when String
        { keyword: keywords }
      else
        raise ArgumentError.new('Keywords is malformed, should be a string or array')
      end.merge(@options)

      response = @connection.get('/fetch', options.merge(input))

      parsed = JSON.parse(response.body)

      if parsed['error']
        raise StandardError.new(parsed['error'])
      end

      if parsed['errors']
        raise StandardError.new(parsed['errors'])
      end

      results = parsed['results']

      if input[:keyword]
        Volume.new(results[0])
      else
        results.map { |r| Volume.new(r) }
      end
    end

  protected

    def api_url
      'http://api3.wordtracker.com/'
    end
  end
end