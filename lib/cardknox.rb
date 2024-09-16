# frozen_string_literal: true

require "faraday"
require "zeitwerk"
require_relative "cardknox/version"

module Cardknox
  BASE_URL = "https://x1.cardknox.com"

  class << self
    def loader
      @loader ||= Zeitwerk::Loader.for_gem.tap do |loader|
        loader.inflector.inflect("api" => "API")
      end
    end
  end
  loader.setup
end
