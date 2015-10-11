Gem::Specification.new do |s|
  s.name        = 'chilling_effects'
  s.version     = '0.0.1'
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

  s.add_runtime_dependency "faraday", "~> 0.9.0"
  s.add_runtime_dependency "hashie", "~> 3.4.2"
  s.add_runtime_dependency "activemodel"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "validate_url"
  s.add_development_dependency "pry"
  s.add_development_dependency "vcr"
  s.add_development_dependency "rake"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "bundler"
end
