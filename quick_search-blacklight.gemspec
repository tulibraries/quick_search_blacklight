$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "quick_search/blacklight/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "quick_search-blacklight"
  s.version     = QuickSearch::Blacklight::VERSION
  s.authors     = ["Chad Nelson"]
  s.email       = ["chad.nelson@temple.edu"]
  s.homepage    = "http://github.com/tulibraries/quick_search-blackight"
  s.summary     = "Summary"
  s.description = "Plugin for quick_search for searching Blacklight sites via json api"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "quick_search-core", '~> 0'

  s.add_development_dependency "sqlite3"
end
