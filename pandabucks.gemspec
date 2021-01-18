require_relative 'lib/pandabucks/version'

Gem::Specification.new do |spec|
  spec.name          = "pandabucks"
  spec.version       = Pandabucks::VERSION
  spec.authors       = ["aweglteo"]
  spec.email         = ["awegl.teo@gmail.com"]

  spec.summary       = "very simple toy web server based on rack"
  spec.description   = "This is for study purpose"
  spec.homepage      = "https://github.com/aweglteo/pandabucks"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/aweglteo/pandabucks"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aweglteo/pandabucks"
  spec.metadata["changelog_uri"] = "https://github.com/aweglteo/pandabucks"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
