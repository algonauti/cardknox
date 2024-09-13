# frozen_string_literal: true

require_relative "lib/cardknox/version"

Gem::Specification.new do |spec|
  spec.name = "cardknox"
  spec.version = Cardknox::VERSION
  spec.authors = ["Algonauti"]
  spec.email = ["devel@algonauti.com"]

  spec.summary = "ruby client for easy integration with cardknow API."
  spec.description = "Provides a ruby interface to interact with the cardknow API"
  spec.homepage = "https://github.com/algonauti/cardknow"
  spec.license = "MIT"

  # Set a minimum Ruby version requirement
  spec.required_ruby_version = ">= 3.0.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)

  spec.files = IO.popen(["git", "ls-files", "-z"], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?("bin/", "test/", "spec/", "features/", ".git", ".github", "appveyor", "Gemfile")
    end
  end
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency("zeitwerk", "~> 2.6")
end
