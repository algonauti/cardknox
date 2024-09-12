# frozen_string_literal: true

require "zeitwerk"
require_relative "cardknox/version"

module Cardknox
  class Error < StandardError; end

  def self.loader
    @loader ||= Zeitwerk::Loader.for_gem.tap do |loader|
      # customize
    end
  end

  loader.setup
end
