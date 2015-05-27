$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smart_truncate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smart_truncate"
  s.version     = SmartTruncate::VERSION
  s.authors     = ["Yavor Ivanov"]
  s.email       = ["yavor.dimitrov.ivanov@gmail.com"]
  s.homepage    = "https://github.com/YavorIvanov/SmartTruncate"
  s.summary     = "smart_truncate is a simple Rails gem that truncates text like a human."
  s.description = "Ever wanted to truncate some text till the Ntn character only to find a word or sentence was cut in half? SmartTruncate fixes that."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_runtime_dependency 'activesupport', '>= 3.0.0'
  s.add_runtime_dependency 'rake'
  
end
