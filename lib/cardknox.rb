# frozen_string_literal: true

require "faraday"
require "zeitwerk"
require_relative "cardknox/version"

module Cardknox
  class Error < StandardError; end

  class << self
    def loader
      @loader ||= Zeitwerk::Loader.for_gem.tap do |loader|
        loader.inflector.inflect("api" => "API")
        loader.inflector.inflect("http_client" => "HTTPClient")
      end
    end
  end

  loader.setup
end
