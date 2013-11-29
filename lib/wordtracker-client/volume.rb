require 'time'

module Wordtracker
  class Volume < Wrapper
    accessor :volume
    accessor :country
    accessor :adult
    accessor :keyword

    timestamp :timestamp
  end
end