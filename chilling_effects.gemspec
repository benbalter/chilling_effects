Gem::Specification.new do |s|
  s.name        = 'chilling_effects'
  s.version     = '0.0.1'
  s.license     = 'GPL-2'
  s.summary     = "This is an example!"
  s.description = "Much longer explanation of the example!"
  s.author      = "Ben Balter"
  s.email       = 'ben.balter@github.com'
  s.files       = ["lib/"]
  s.homepage    = 'https://github.com/benbalter/chilling_effects'

  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "hashie"
  s.add_runtime_dependency "activemodel"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "validate_url"
  s.add_development_dependency "pry"
end
