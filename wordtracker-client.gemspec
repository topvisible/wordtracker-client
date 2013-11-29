$:.unshift(File.expand_path('../lib', __FILE__))

require 'wordtracker-client/version'

Gem::Specification.new do |s|
  s.name        = 'wordtracker-client'
  s.version     = Wordtracker::VERSION
  s.summary     = 'A wrapper around Wordtracker'
  s.description = 'Downloads information from the Wordtracker API'
  s.authors     = ['TopVisible AB']
  s.email       = 'dev@ranktrail.se'
  s.files       = Dir.glob('{bin,lib}/**/*.rb')
  s.homepage    = 'http://www.ranktrail.se/'
  s.executables = ['wordtracker-fetch']

  s.add_runtime_dependency 'faraday', '~> 0.8'
end