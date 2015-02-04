$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "db_patch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "db_patch"
  s.version     = DbPatch::VERSION
  s.authors     = ["Yuto Ogi"]
  s.email       = ["jacoyutorius@gmail.com"]
  s.homepage    = "https://github.com/jacoyutorius/rails_db_patch"
  s.summary     = "Manage tool for ruby script which executed to DB only once."
  s.description = "Manage tool for ruby script which executed to DB only once."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "activerecord"
  # s.add_development_dependency "sqlite3"
end
