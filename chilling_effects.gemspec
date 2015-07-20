Gem::Specification.new do |s|
  s.name        = 'chilling_effects'
  s.version     = '0.0.1.ksr0'
  s.license     = 'GPL-2'
  s.summary     = "A Ruby gem to interact with the Chilling Effects API"
  s.description = "A Ruby gem to interact with the Chilling Effects API."
  s.author      = "Ben Balter"
  s.email       = 'ben.balter@github.com'
  s.files       = [
    "lib/chilling_effects.rb",
    "lib/chilling_effects/copyrighted_url.rb",
    "lib/chilling_effects/entity_notice_role.rb",
    "lib/chilling_effects/entity.rb",
    "lib/chilling_effects/file_upload.rb",
    "lib/chilling_effects/infringing_url.rb",
    "lib/chilling_effects/notice.rb",
    "lib/chilling_effects/topic.rb",
    "lib/chilling_effects/url.rb",
    'lib/chilling_effects/work.rb',
    "LICENSE",
    "README.md"
  ]
  s.homepage    = 'https://github.com/benbalter/chilling_effects'

  s.add_runtime_dependency "faraday", "~> 0.9"
  s.add_runtime_dependency "faraday_middleware", "~> 0.9"
  s.add_runtime_dependency "hashie", "~> 3.4"
  s.add_runtime_dependency "activemodel", "~> 4.0"
  s.add_runtime_dependency "activesupport", "~> 4.0"
  s.add_runtime_dependency "validate_url", "~> 1.0"

  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency "vcr", "~> 2.9"
  s.add_development_dependency "rake", "~> 10.4"
  s.add_development_dependency "shoulda", "~> 3.5"
  s.add_development_dependency "rdoc", "~> 4.2"
  s.add_development_dependency "bundler", "~> 1.10"
end
