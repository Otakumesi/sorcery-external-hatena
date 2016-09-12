$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "expand_sorcery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sorcery-external-hatena"
  s.version     = Sorcery::Providers::Hatena::VERSION
  s.authors     = ["otakumesi"]
  s.email       = ["bakednt@gmail.com"]
  s.homepage    = "https://github.com/Otakumesi/sorcery-external-hatena"
  s.summary     = "Hatena OAuth for External of Sorcery"
  s.description = "Add Hatena OAuth Login to External in Sorcery of Rails Plugin."
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  #s.add_dependency "rails", "~> 5.0.0"

  s.add_dependency "sorcery", "~>0.9"
  s.add_dependency "thor", "0.19.1"
end
