require 'wordtracker-client/version'

require 'wordtracker-client/wrapper'
require 'wordtracker-client/volume'

require 'wordtracker-client/client'

module Wordtracker
  class << self
    def new(*options)
      Client.new(*options)
    end
  end
end
