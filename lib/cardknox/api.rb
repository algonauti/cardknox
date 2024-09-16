# frozen_string_literal: true

module Cardknox
  module API
    class Client
      attr_reader :agent
      attr_accessor :config

      def initialize(key)
        @agent = Agent.new(Cardknox::BASE_URL)
        @config = Cardknox::Configuration.new.tap do |config|
          config.api_key = key
        end
        yield(config) if block_given?
      end

      def transaction(command, params = {})
        @agent.post("/gatewayjson", params.merge({
          xKey: config.api_key,
          xVersion: config.gateway_version,
          xSoftwareName: config.software_name,
          xSoftwareVersion: config.software_version,
          xCommand: command,
        }))
      end

      def status
        @agent.get("/status")
      end
    end
  end
end
