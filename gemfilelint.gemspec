# frozen_string_literal: true

require_relative "lib/gemfilelint/version"

version = Gemfilelint::VERSION
repository = "https://github.com/kddnewton/gemfilelint"

Gem::Specification.new do |spec|
  spec.name = "gemfilelint"
  spec.version = version
  spec.authors = ["Kevin Newton"]
  spec.email = ["kddnewton@gmail.com"]

  spec.summary = "Lint your Gemfile!"
  spec.homepage = repository
  spec.license = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "#{repository}/issues",
    "changelog_uri" => "#{repository}/blob/v#{version}/CHANGELOG.md",
    "source_code_uri" => repository,
    "rubygems_mfa_required" => "true"
  }

  spec.files =
    Dir.chdir(__dir__) do
      `git ls-files -z`.split("\x0")
        .reject { |f| f.match(%r{^(test|spec|features)/}) }
    end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "syntax_tree"
end
