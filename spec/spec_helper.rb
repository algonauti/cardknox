# frozen_string_literal: true

require "cardknox"
require "dotenv/load"

Dotenv.overload(".env", ".env.test")

Dir[Pathname.new(File.dirname(__dir__)).join("spec/support/**/*.rb")].each do |file|
  require file
end

module TestHelpers
end

RSpec.configure do |config|
  config.include(TestHelpers)

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with(:rspec) do |c|
    c.syntax = :expect
  end
end
